# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261109074436524), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Aprovisionamiento de infraestructura de servicio de notificaciones con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Configurar el entorno de Terraform para el aprovisionamiento de la infraestructura. — entregable (NO resolver): Configuración de Terraform lista para el aprovisionamiento de la infraestructura.
- Fase 2: Aprovisionamiento de la red — objetivo: Aprovisionar la red necesaria para el servicio de notificaciones. — entregable (NO resolver): Red aprovisionada y funcional para el servicio de notificaciones.
- Fase 3: Aprovisionamiento del computo — objetivo: Aprovisionar los recursos de computo necesarios para el servicio de notificaciones. — entregable (NO resolver): Recursos de computo aprovisionados y funcionales para el servicio de notificaciones.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: variables.tf ===
# variables.tf - Declaración de variables globales para el aprovisionamiento de infraestructura
# Estas variables permiten parametrizar la infraestructura y separar la configuración de los valores.

variable "aws_region" {
  description = "Región de AWS donde se aprovisionará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Nombre del ambiente (dev, prod, staging)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 en us-east-1
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Capacidad deseada de instancias en el Auto Scaling Group"
  type        = number
  default     = 2
}

// === ARCHIVO: providers.tf ===
# providers.tf - Configuración del provider AWS y restricciones de versión para Terraform
# Este archivo define el proveedor cloud y la versión de Terraform requerida para el proyecto.

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del provider AWS
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = "notification-service"
      ManagedBy   = "Terraform"
    }
  }
}

# Configuración adicional para soportar features avanzadas de AWS
provider "aws" {
  alias  = "secondary"
  region = "us-west-2"
}

// === ARCHIVO: modules/network/variables.tf ===
# modules/network/variables.tf - Variables de entrada para el módulo de red
# Estas variables permiten configurar la VPC y sus subredes de manera dinámica.

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC del módulo de red"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "environment" {
  description = "Nombre del ambiente (dev, prod, staging)"
  type        = string
}

variable "enable_nat_gateway" {
  description = "Habilitar NAT Gateway para las subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usar un único NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Habilitar DNS hostnames en la VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Habilitar soporte DNS en la VPC"
  type        = bool
  default     = true
}

// === ARCHIVO: modules/compute/variables.tf ===
# modules/compute/variables.tf - Variables de entrada para el módulo de computo
# Estas variables permiten configurar los recursos de EC2 y Auto Scaling para el servicio.

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada de instancias en el Auto Scaling Group"
  type        = number
}

variable "environment" {
  description = "Nombre del ambiente (dev, prod, staging)"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs de security groups para las instancias"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes donde se desplegarán las instancias"
  type        = list(string)
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
  default     = "notification-service-key"
}

variable "user_data" {
  description = "Script de user data para configurar las instancias al arrancar"
  type        = string
  default     = ""
}

variable "enable_monitoring" {
  description = "Habilitar monitoreo detallado para las instancias"
  type        = bool
  default     = true
}

// === ARCHIVO: main.tf ===
terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Módulo de red: aprovisiona VPC, subredes y componentes de red
module "network" {
  source = "./modules/network"

  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = var.tags
}

# Módulo de compute: aprovisiona instancias EC2, grupos de autoescalado y balanceadores
module "compute" {
  source = "./modules/compute"

  environment          = var.environment
  vpc_id               = module.network.vpc_id
  subnet_ids           = module.network.private_subnet_ids
  instance_type        = var.instance_type
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  ami_id               = var.ami_id
  key_name             = var.key_name
  user_data            = var.user_data
  health_check_type    = var.health_check_type
  target_group_arns    = module.network.target_group_arns
  tags                 = var.tags
}

// === ARCHIVO: outputs.tf ===
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = module.network.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = module.network.private_subnet_ids
}

output "alb_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.network.alb_arn
}

output "alb_dns_name" {
  description = "Nombre DNS del ALB para acceso al servicio"
  value       = module.network.alb_dns_name
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}

output "asg_arn" {
  description = "ARN del Auto Scaling Group"
  value       = module.compute.asg_arn
}

output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = module.compute.instance_ids
}

output "security_group_id" {
  description = "ID del security group aplicado a las instancias"
  value       = module.compute.security_group_id
}

// === ARCHIVO: README.md ===
# Infraestructura del Servicio de Notificaciones

Este proyecto aprovisiona la infraestructura necesaria para el servicio de notificaciones utilizando Terraform. La arquitectura usa módulos reutilizables para separar la configuración de red y compute.

## Estructura del Proyecto

```
.
├── main.tf                    # Definición de recursos principales y módulos
├── outputs.tf                 # Salidas de la infraestructura aprovisionada
├── variables.tf               # Variables del proyecto raíz
├── providers.tf               # Configuración de providers
├── modules/
│   ├── network/               # Módulo de red (VPC, subredes, ALB)
│   └── compute/               # Módulo de compute (EC2, ASG)
├── environments/
│   ├── dev/                   # Configuración para desarrollo
│   │   └── terraform.tfvars
│   └── prod/                  # Configuración para producción
│       └── terraform.tfvars
└── scripts/
    └── healthcheck.sh         # Script de verificación de salud
```

## Prerrequisitos

- Terraform >= 1.5 instalado
- Credenciales de AWS configuradas (variables de entorno, perfil o archivo de credenciales)
- Acceso a la cuenta de AWS con permisos suficientes para crear recursos

## Configuración de Credenciales AWS

### Opción 1: Variables de entorno
```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_REGION="us-east-1"
```

### Opción 2: Perfil named
```bash
export AWS_PROFILE="my-profile"
```

### Opción 3: Archivo de credenciales
Editar `~/.aws/credentials` y configurar el perfil deseado.

## Inicialización del Proyecto

1. Navegar al directorio del ambiente deseado:
```bash
cd environments/dev  # Para desarrollo
# o
cd environments/prod # Para producción
```

2. Inicializar Terraform:
```bash
terraform init
```

3. Validar la configuración:
```bash
terraform validate
```

4. Ver el plan de ejecución:
```bash
terraform plan -out=tfplan
```

## Aplicar la Infraestructura

Para aplicar los cambios:
```bash
terraform apply tfplan
```

O directamente (sin guardar el plan):
```bash
terraform apply
```

## Verificar la Infraestructura

Después de aplicar, ejecutar el healthcheck:
```bash
../scripts/healthcheck.sh
```

También se pueden verificar los outputs:
```bash
terraform output
```

## Destruir la Infraestructura

**Advertencia**: Esta acción eliminará todos los recursos aprovisionados.
```bash
terraform destroy
```

Para destruir sin confirmación interactiva:
```bash
terraform destroy -auto-approve
```

## Variables Principales

| Variable | Descripción | Valor por defecto |
|----------|-------------|-------------------|
| `environment` | Ambiente de despliegue (dev, prod) | "dev" |
| `region` | Región de AWS | "us-east-1" |
| `vpc_cidr` | Bloque CIDR de la VPC | "10.0.0.0/16" |
| `instance_type` | Tipo de instancia EC2 | "t3.micro" |
| `min_size` | Tamaño mínimo del ASG | 1 |
| `max_size` | Tamaño máximo del ASG | 3 |
| `desired_capacity` | Capacidad deseada del ASG | 1 |

## Recursos Aprovisionados

### Red
- VPC con CIDR configurable
- Subredes públicas y privadas en múltiples AZs
- Internet Gateway
- NAT Gateways para outbound desde subredes privadas
- Route Tables asociadas
- Application Load Balancer
- Target Groups para el servicio

### Compute
- Auto Scaling Group
- Launch Template con configuración de instancias
- Security Groups para acceso
- Instancias EC2 en subredes privadas

## Notas de Seguridad

- Los secretos nunca deben incluirse en el repositorio
- Usar AWS Secrets Manager o Parameter Store para datos sensibles
- Las credenciales de AWS deben manejarse fuera del código
- Revisar los outputs para verificar información sensible expuesta

## Troubleshooting

### Error: Provider not initialized
Ejecutar `terraform init` nuevamente para descargar los providers.

### Error: Resource limit exceeded
Verificar los límites de la cuenta AWS y solicitar aumento si es necesario.

### Error: Permission denied
Verificar que las credenciales tengan los permisos necesarios para crear recursos.

// === ARCHIVO: modules/network/main.tf ===
# Módulo de red para el servicio de notificaciones
# Este archivo define la infraestructura de red necesaria:
# - VPC principal
# - Subredes públicas y privadas
# - Grupos de seguridad
# - NAT Gateway e Internet Gateway

# VPC principal
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.project}-${var.environment}-vpc"
    Environment = var.environment
    Project     = var.project
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project}-${var.environment}-igw"
    Environment = var.environment
  }
}

# Tabla de rutas pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "${var.project}-${var.environment}-public-rt"
    Environment = var.environment
  }
}

# Subredes públicas
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project}-${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "public"
  }
}

# Subredes privadas
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "${var.project}-${var.environment}-private-subnet-${count.index + 1}"
    Environment = var.environment
    Type        = "private"
  }
}

# Tabla de rutas privada
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project}-${var.environment}-private-rt"
    Environment = var.environment
  }
}

# NAT Gateway en cada AZ
resource "aws_nat_gateway" "main" {
  count         = length(var.availability_zones)
  subnet_id     = aws_subnet.public[count.index].id
  allocation_id = aws_eip.nat[count.index].id

  tags = {
    Name        = "${var.project}-${var.environment}-nat-${count.index + 1}"
    Environment = var.environment
  }

  depends_on = [aws_internet_gateway.main]
}

# Elastic IPs para NAT Gateway
resource "aws_eip" "nat" {
  count  = length(var.availability_zones)
  domain = "vpc"

  tags = {
    Name        = "${var.project}-${var.environment}-nat-eip-${count.index + 1}"
    Environment = var.environment
  }
}

# Asociar subredes públicas a tabla de rutas pública
resource "aws_route_table_association" "public" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Asociar subredes privadas a tabla de rutas privada
resource "aws_route_table_association" "private" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

# Grupo de seguridad para aplicaciones
resource "aws_security_group" "app" {
  name        = "${var.project}-${var.environment}-app-sg"
  description = "Grupo de seguridad para el servicio de notificaciones"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr_blocks
  }

  egress {
    description = "Salida allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project}-${var.environment}-app-sg"
    Environment = var.environment
  }
}

// === ARCHIVO: modules/network/outputs.tf ===
# Outputs del módulo de red
# Exponen los IDs de recursos creados para consumo por otros módulos

output "vpc_id" {
  description = "ID de la VPC principal"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id
}

output "security_group_app_id" {
  description = "ID del grupo de seguridad de aplicaciones"
  value       = aws_security_group.app.id
}

output "nat_gateway_ids" {
  description = "IDs de los NAT Gateways"
  value       = aws_nat_gateway.main[*].id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de compute para el servicio de notificaciones
# Este archivo define los recursos de computo necesarios:
# - Instancias EC2 o Auto Scaling Group
# - Roles IAM y políticas
# - Configuración de almacenamiento
# - User data para bootstrapping

# Rol IAM para las instancias
resource "aws_iam_role" "ec2_role" {
  name = "${var.project}-${var.environment}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}

# Política IAM para CloudWatch Logs
resource "aws_iam_role_policy" "cloudwatch_logs" {
  name = "${var.project}-${var.environment}-cloudwatch-logs"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:${var.region}:${var.account_id}:log-group:${var.project}/${var.environment}/*"
      }
    ]
  })
}

# Perfil de instancia EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project}-${var.environment}-ec2-profile"
  role = aws_iam_role.ec2_role.name

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}

# Launch Template para Auto Scaling Group
resource "aws_launch_template" "notification_service" {
  name          = "${var.project}-${var.environment}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_profile.arn
  }

  vpc_security_group_ids = [var.security_group_id]

  user_data = base64encode(templatefile("${path.module}/user_data.sh", {
    environment           = var.environment
    project               = var.project
    notification_endpoint = var.notification_endpoint
  }))

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project}-${var.environment}-notification"
      Environment = var.environment
      Project     = var.project
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "notification_service" {
  name                = "${var.project}-${var.environment}-asg"
  vpc_zone_identifier = var.private_subnet_ids
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  health_check_type   = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.notification_service.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project}-${var.environment}-notification"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Política de escalado
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.project}-${var.environment}-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.notification_service.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.project}-${var.environment}-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.notification_service.name
}

# Alarmas CloudWatch para escalado
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.project}-${var.environment}-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = var.cpu_threshold_high
  alarm_description   = "Escalar arriba cuando CPU > ${var.cpu_threshold_high}%"
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.notification_service.name
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.project}-${var.environment}-cpu-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = var.cpu_threshold_low
  alarm_description   = "Escalar abajo cuando CPU < ${var.cpu_threshold_low}%"
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.notification_service.name
  }
}

// === ARCHIVO: modules/compute/outputs.tf ===
output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notification_service[*].id
}

output "public_ips" {
  description = "Direcciones IP públicas de las instancias"
  value       = aws_instance.notification_service[*].public_ip
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias"
  value       = aws_instance.notification_service[*].private_ip
}

output "security_group_id" {
  description = "ID del grupo de seguridad asociado a las instancias"
  value       = aws_security_group.instance_sg.id
}

output "iam_instance_profile" {
  description = "Nombre del perfil de instancia IAM"
  value       = aws_iam_instance_profile.notification_profile.name
}

// === ARCHIVO: environments/dev/terraform.tfvars ===
environment_name = "dev"

vpc_id           = "vpc-xxxxxxxx"
subnet_ids       = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]

instance_type    = "t3.small"
instance_count   = 2

ami_id           = "ami-0c55b159cbfafe1f0"

key_name         = "dev-notifications-key"

user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              docker run -d --name notifications -p 8080:8080 notifications:latest
              EOF

security_groups = ["sg-xxxxxxxx"]

tags = {
  Environment = "development"
  Project     = "notification-service"
  ManagedBy   = "terraform"
  CostCenter  = "dev-team"
}

// === ARCHIVO: environments/prod/terraform.tfvars ===
environment_name = "prod"

vpc_id           = "vpc-yyyyyyyy"
subnet_ids       = ["subnet-zzzzzzzz", "subnet-aaaaaaaa"]

instance_type    = "t3.medium"
instance_count   = 4

ami_id           = "ami-0c55b159cbfafe1f0"

key_name         = "prod-notifications-key"

user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker docker-compose
              systemctl start docker
              systemctl enable docker
              curl -s https://raw.githubusercontent.com/containers/podman/main/contrib/podmanimage/stable/Containerfile | podman build -t notifications:latest .
              podman run -d --name notifications --restart=always -p 8080:8080 notifications:latest
              EOF

security_groups = ["sg-yyyyyyyy"]

tags = {
  Environment = "production"
  Project     = "notification-service"
  ManagedBy   = "terraform"
  CostCenter  = "core-services"
  Compliance  = "pci-dss"
}

// === ARCHIVO: scripts/healthcheck.sh ===
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

// === ARCHIVO: Dockerfile ===
# Dockerfile multi-stage para el servicio de notificaciones
# Stage 1: Build - Compilación del servicio
FROM golang:1.21-alpine AS builder

WORKDIR /build

# Copy go mod files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o notification-service .

# Stage 2: Runtime - Imagen final ligera
FROM alpine:latest

# Install required packages for runtime
RUN apk --no-cache add ca-certificates curl

# Create non-root user for security
RUN adduser -D -u 1000 appuser

WORKDIR /app

# Copy binary from builder stage
COPY --from=builder /build/notification-service /app/

# Copy configuration files
COPY config/ /app/config/

# Set ownership
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose application port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/health || exit 1

# Set environment variables
ENV SERVICE_NAME=notification-service \
    ENVIRONMENT=production \
    LOG_LEVEL=info

# Entry point
ENTRYPOINT ["/app/notification-service"]
```
