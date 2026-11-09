#!/bin/bash
set -euo pipefail

# =============================================================================
# Script de verificación de salud de recursos aprovisionados
# Verifica que los recursos de red y computo estén correctamente aprovisionados
# =============================================================================

# Cargar variables de entorno del workspace de Terraform
TERRAFORM_DIR="${TERRAFORM_DIR:-.}"
STATE_FILE="${TERRAFORM_DIR}/terraform.tfstate"
ENVIRONMENT="${ENVIRONMENT:-dev}"

# Colores para salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Función para verificar si Terraform está inicializado
check_terraform_initialized() {
    log_info "Verificando inicialización de Terraform..."
    
    if [ ! -d "${TERRAFORM_DIR}/.terraform" ]; then
        log_error "Terraform no está inicializado. Ejecute 'terraform init' primero."
        return 1
    fi
    
    if [ ! -f "${STATE_FILE}" ]; then
        log_warn "No se encontró archivo de estado. ¿Ya ejecutó 'terraform apply'?"
        return 1
    fi
    
    log_info "Terraform está inicializado correctamente"
    return 0
}

# Función para obtener ID de VPC desde el estado de Terraform
get_vpc_id() {
    local vpc_id
    vpc_id=$(cd "${TERRAFORM_DIR}" && terraform output -raw vpc_id 2>/dev/null || echo "")
    
    if [ -z "${vpc_id}" ]; then
        log_error "No se pudo obtener el ID de VPC desde las outputs de Terraform"
        return 1
    fi
    
    echo "${vpc_id}"
    return 0
}

# Función para obtener IDs de subnets desde el estado de Terraform
get_subnet_ids() {
    local subnet_ids
    subnet_ids=$(cd "${TERRAFORM_DIR}" && terraform output -json subnet_ids 2>/dev/null || echo "[]")
    
    if [ "${subnet_ids}" = "[]" ] || [ -z "${subnet_ids}" ]; then
        log_error "No se pudieron obtener los IDs de las subnets desde las outputs de Terraform"
        return 1
    fi
    
    echo "${subnet_ids}"
}

# Función para verificar que la VPC existe en AWS
verify_vpc_exists() {
    local vpc_id="$1"
    log_info "Verificando que la VPC ${vpc_id} existe en AWS..."
    
    local vpc_state
    vpc_state=$(aws ec2 describe-vpcs --vpc-ids "${vpc_id}" --query 'Vpcs[0].State' --output text 2>/dev/null || echo "not-found")
    
    if [ "${vpc_state}" = "available" ]; then
        log_info "VPC ${vpc_id} está disponible"
        return 0
    else
        log_error "VPC ${vpc_id} no está disponible (estado: ${vpc_state})"
        return 1
    fi
}

# Función para verificar que las subnets existen y están disponibles
verify_subnets() {
    local subnet_json="$1"
    log_info "Verificando subnets...""
    
    local subnet_ids
    subnet_ids=$(echo "${subnet_json}" | jq -r '.[]' 2>/dev/null || echo "")
    
    if [ -z "${subnet_ids}" ]; then
        log_error "No se pudieron parsear los IDs de subnets"
        return 1
    fi
    
    local all_available=true
    for subnet_id in ${subnet_ids}; do
        local subnet_state
        subnet_state=$(aws ec2 describe-subnets --subnet-ids "${subnet_id}" --query 'Subnets[0].State' --output text 2>/dev/null || echo "not-found")
        
        if [ "${subnet_state}" = "available" ]; then
            log_info "Subnet ${subnet_id} está disponible"
        else
            log_error "Subnet ${subnet_id} no está disponible (estado: ${subnet_state})"
            all_available=false
        fi
    done
    
    if [ "${all_available}" = true ]; then
        return 0
    else
        return 1
    fi
}

# Función para verificar recursos de compute (instancias EC2)
verify_compute_instances() {
    log_info "Verificando instancias de compute..."
    
    # Obtener IDs de instancias desde outputs de Terraform
    local instance_ids
    instance_ids=$(cd "${TERRAFORM_DIR}" && terraform output -json instance_ids 2>/dev/null || echo "[]")
    
    if [ "${instance_ids}" = "[]" ] || [ -z "${instance_ids}" ]; then
        log_warn "No hay instancias de compute configuradas en las outputs"
        return 0
    fi
    
    local ids_count
    ids_count=$(echo "${instance_ids}" | jq 'length' 2>/dev/null || echo "0")
    
    if [ "${ids_count}" -eq 0 ]; then
        log_warn "No se encontraron instancias de compute"
        return 0
    fi
    
    log_info "Verificando ${ids_count} instancia(s) de compute..."
    
    local all_running=true
    for instance_id in $(echo "${instance_ids}" | jq -r '.[]'); do
        local instance_state
        instance_state=$(aws ec2 describe-instances --instance-ids "${instance_id}" --query 'Reservations[0].Instances[0].State.Name' --output text 2>/dev/null || echo "not-found")
        
        if [ "${instance_state}" = "running" ]; then
            log_info "Instancia ${instance_id} está en estado running"
        else
            log_error "Instancia ${instance_id} no está en estado running (estado: ${instance_state})"
            all_running=false
        fi
    done
    
    if [ "${all_running}" = true ]; then
        return 0
    else
        return 1
    fi
}

# Función para verificar conectividad básica a las instancias
verify_connectivity() {
    log_info "Verificando conectividad a las instancias..."
    
    local instance_ips
    instance_ips=$(cd "${TERRAFORM_DIR}" && terraform output -json instance_private_ips 2>/dev/null || echo "[]")
    
    if [ "${instance_ips}" = "[]" ] || [ -z "${instance_ips}" ]; then
        log_warn "No hay IPs privadas de instancias en las outputs"
        return 0
    fi
    
    local ips_count
    ips_count=$(echo "${instance_ips}" | jq 'length' 2>/dev/null || echo "0")
    
    if [ "${ips_count}" -eq 0 ]; then
        return 0
    fi
    
    log_info "Verificando conectividad SSH a ${ips_count} instancia(s)..."
    
    # Verificar que el puerto 22 está abierto en los security groups
    local subnet_json
    subnet_json=$(get_subnet_ids)
    
    for ip in $(echo "${instance_ips}" | jq -r '.[]'); do
        log_info "Verificando conectividad a ${ip}..."
        # Prueba de conectividad básica (timeout corto para healthcheck)
        if timeout 2 bash -c "cat < /dev/null > /dev/tcp/${ip}/22" 2>/dev/null; then
            log_info "Puerto 22 accesible en ${ip}"
        else
            log_warn "Puerto 22 no accesible en ${ip} (puede ser normal si el SG no permite SSH desde este host)"
        fi
    done
    
    return 0
}

# Función principal que orquesta todas las verificaciones
main() {
    local exit_code=0
    
    echo "=============================================="
    echo "  Healthcheck - Recursos de Notificaciones"
    echo "  Entorno: ${ENVIRONMENT}"
    echo "=============================================="
    echo ""
    
    # Verificar que Terraform está inicializado
    if ! check_terraform_initialized; then
        log_error "Falló la verificación de inicialización de Terraform"
        exit 1
    fi
    
    echo ""
    echo "--- Verificación de Red ---"
    
    # Obtener y verificar VPC
    local vpc_id
    vpc_id=$(get_vpc_id) || {
        log_error "No se pudo obtener el ID de VPC"
        exit 1
    }
    
    if ! verify_vpc_exists "${vpc_id}"; then
        log_error "Falló la verificación de VPC"
        exit_code=1
    fi
    
    # Obtener y verificar subnets
    local subnet_json
    subnet_json=$(get_subnet_ids) || {
        log_error "No se pudieron obtener los IDs de subnets"
        exit_code=1
    }
    
    if ! verify_subnets "${subnet_json}"; then
        log_error "Falló la verificación de subnets"
        exit_code=1
    fi
    
    echo ""
    echo "--- Verificación de Compute ---"
    
    # Verificar instancias de compute
    if ! verify_compute_instances; then
        log_error "Falló la verificación de instancias de compute"
        exit_code=1
    fi
    
    # Verificar conectividad
    if ! verify_connectivity; then
        log_warn "Falló la verificación de conectividad (no crítico)"
    fi
    
    echo ""
    echo "=============================================="
    
    if [ "${exit_code}" -eq 0 ]; then
        log_info "Healthcheck completado exitosamente - Todos los recursos están saludables"
    else
        log_error "Healthcheck completado con errores - Revise los mensajes anteriores"
    fi
    
    echo "=============================================="
    
    exit "${exit_code}"
}

# Ejecutar función principal
main "$@"