variable "name" {
  type        = string
  description = "The name of the launch config and asg."
}

variable "image_id" {
  type        = string
  description = "The ID of the Amazon Machine Image (AMI) to use."
}

variable "instance_type" {
  type        = string
  description = "The instance type of the EC2 instance."
  default     = "t2.micro"
}

variable "security_groups" {
  type        = list(string)
  description = "A list of associated security group IDS."
}

variable "user_data" {
  type        = string
  description = "The user data to provide when launching the instance."
  default     = " "
}

variable "iam_instance_profile_name" {
  type        = string
  description = "The name of the IAM instance profile to associate with launched instances."
  default     = "LabRole"
}

variable "vpc_zone_identifier" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
}

variable "min_size" {
  description = "The minimum size of the autoscale group."
  type        = number
}

variable "max_size" {
  description = "The maximum size of the autoscale group."
  type        = number
}

variable "desired_capacity" {
  description = "The desired size of the autoscale group."
  type        = number
}

variable "health_check_type" {
  description = "Controls how health checking is done."
  type        = string
  default     = "ELB"
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health."
  type        = number
  default     = 300
}

variable "target_group_arns" {
  description = "A list of aws_alb_target_group ARNs, for use with Application or Network Load Balancing."
  type        = list(string)
}

variable "key_name" {
  description = "The key name that should be used for the instance."
  type        = string
}
