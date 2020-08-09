provider "aws" { region = "ap-northeast-1" }

# VPC
module "module_vpc" {
  source = "./modules/vpc"

  service = var.service
  env     = var.env

  vpc_cidr              = var.vpc_cidr
  public_subnet_a_cidr  = var.public_subnet_a_cidr
  public_subnet_c_cidr  = var.public_subnet_c_cidr
  public_subnet_d_cidr  = var.public_subnet_d_cidr
  private_subnet_a_cidr = var.private_subnet_a_cidr
  private_subnet_c_cidr = var.private_subnet_c_cidr
  private_subnet_d_cidr = var.private_subnet_d_cidr
  route_table_cidr      = var.route_table_cidr
}
