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