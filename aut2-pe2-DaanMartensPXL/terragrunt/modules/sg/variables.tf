variable "name" {
  description = "The name of the security group."
  type        = string
}

variable "description" {
  description = "The description of the security group."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
  type        = string
}

variable "ingress_ports" {
  description = "List of ingress ports."
  type        = list(number)
}

variable "egress_ports" {
  description = "List of egress ports."
  type        = list(number)
}

variable "protocol" {
  description = "The protocol to use."
  type        = string
  default     = "tcp"
}

variable "cidr_blocks" {
  description = "The CIDR blocks for the ingress rule."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "The CIDR blocks for the egress rule."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "name_tag" {
  description = "The name tag for the security group."
  type        = string
}