terraform {
  source = "../../../modules/asg"
}

include {
  path = find_in_parent_folders()
}

dependency "backend_sg" {
  config_path = "../backend_sg"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "backend_alb" {
  config_path = "../backend_alb"
}

dependency "s3" {
  config_path = "../s3"
}

dependency "db" {
  config_path = "../db"
}

dependency "ssh_sg" {
  config_path = "../ssh_sg"
}

inputs = {
  name             = "production-backend"
  image_id         = "ami-0490e277aca60aa64"
  security_groups  = [dependency.backend_sg.outputs.security_group_id, dependency.ssh_sg.outputs.security_group_id]
  iam_instance_profile_name = "production-backend"
  vpc_zone_identifier       = dependency.vpc.outputs.public_subnets
  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 2
  health_check_type         = "ELB"
  health_check_grace_period = 800
  target_group_arns         = [dependency.backend_alb.outputs.target_group_arn]
  key_name                  = "production-backend"

  user_data = <<EOF
    #!/bin/bash
    echo "S3_BUCKET_NAME=${dependency.s3.outputs.bucket_id}" >> /etc/environment
    echo "DBURL=${dependency.db.outputs.db_instance_endpoint}" >> /etc/environment
    echo "DBPASSWORD=${dependency.db.outputs.db_password}" >> /etc/environment
    cd ~/CloudToDoApp/backend
    sudo npm start
  EOF
}