variable "name" {
  description = "The base name for the ALB and Target Group"
  type        = string
}

variable "tg_port" {
  description = "The port for the Target Group"
  type        = number
}

variable "vpc_id" {
  description = "The VPC ID where resources will be created."
  type        = string
}

variable "lb_sg" {
  description = "Security groups for the Application Load Balancer"
  type        = list(string)
}

variable "lb_subnets" {
  description = "Subnets for the Application Load Balancer"
  type        = list(string)
}

variable "lb_port" {
  description = "The port for the Load Balancer"
  type        = number
}

