resource "random_integer" "name_suffix" {
  min = 1000
  max = 9999
}

resource "aws_launch_configuration" "launch_config" {
  name                  = var.name
  image_id              = var.image_id
  instance_type         = var.instance_type
  security_groups       = var.security_groups
  key_name              = var.key_name
  user_data             = var.user_data
  iam_instance_profile  = aws_iam_instance_profile.lab_role.name
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = "${var.name}-${random_integer.name_suffix.result}"
  launch_configuration = aws_launch_configuration.launch_config.name
  vpc_zone_identifier  = var.vpc_zone_identifier
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  health_check_type    = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  target_group_arns    = var.target_group_arns
  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}

# make use of the LabRole
resource "aws_iam_instance_profile" "lab_role" {
  name = var.iam_instance_profile_name
  role = "LabRole"
}

# generate key pair and save it locally (for ssh access)
resource "aws_key_pair" "key-pair" {
key_name = var.key_name
public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}

resource "local_file" "key" {
content  = tls_private_key.rsa.private_key_pem
filename = var.key_name
}