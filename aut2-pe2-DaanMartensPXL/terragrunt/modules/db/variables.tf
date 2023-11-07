variable "allocated_storage" {
  description = "The amount of storage to allocate to the DB instance, in GiB."
  type        = number
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is launched."
  type        = string
}

variable "engine" {
  description = "The name of the database engine to be used for this DB instance."
  type        = string
}

variable "engine_version" {
  description = "The version number of the database engine to use."
  type        = string
}

variable "instance_class" {
  description = "The compute and memory capacity of the DB instance."
  type        = string
}

variable "username" {
  description = "The name of the master user for the DB instance."
  type        = string
}

variable "password" {
  description = "The password for the master user."
  type        = string
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group to associate with this DB instance."
  type        = string
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  type        = bool
}

variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier."
  type        = string
}

variable "publicly_accessible" {
  description = "Determines if the RDS instance can be publicly accessed."
  type        = bool
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security groups to associate with the DB instance."
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group."
  type        = string
}

variable "availability_zones" {
  description = "A list of availability zones in the region."
  type        = list(string)
}