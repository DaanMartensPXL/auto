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

variable "from_port" {
  description = "The starting port for the ingress rule."
  type        = number
  default     = 22
}

variable "to_port" {
  description = "The ending port for the ingress rule."
  type        = number
  default     = 22
}

variable "protocol" {
  description = "The protocol for the ingress rule."
  type        = string
    default     = "tcp"
}

variable "cidr_blocks" {
  description = "The CIDR blocks for the ingress rule."
  type        = list(string)
    default     = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  description = "The starting port for the egress rule."
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "The ending port for the egress rule."
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "The protocol for the egress rule."
  type        = string
  default     = "-1"
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