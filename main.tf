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