provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name                 = var.vpc_name
  cidr                 = var.cidr_block
  azs                  = var.availability_zones
  private_subnets      = var.private_subnets_cidr_blocks
  public_subnets       = var.public_subnets_cidr_blocks
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.name_db_subnet_group
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "My DB Subnet Group"
  }
}