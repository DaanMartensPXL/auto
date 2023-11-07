output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_name" {
  description = "The name of the VPC."
  value       = module.vpc.name
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
  value       = var.cidr_block
}

output "availability_zones" {
  description = "The availability zones used by the VPC."
  value       = module.vpc.azs
}

output "private_subnets" {
  description = "The CIDR blocks of the private subnets within the VPC."
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "The CIDR blocks of the public subnets within the VPC."
  value       = module.vpc.public_subnets
}

output "db_subnet_group_name" {
  description = "The name of the DB subnet group."
  value       = aws_db_subnet_group.db_subnet_group.name
}

output "azs" {
  description = "A list of availability zones specified as argument to this module."
  value       = var.availability_zones
}