variable "region" {
  description = "The AWS region to deploy the VPC in"
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "The name of the VPC"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "private_subnets_cidr_blocks" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}

variable "public_subnets_cidr_blocks" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

variable "name_db_subnet_group" {
  description = "The name of the DB subnet group."
  type        = string
}