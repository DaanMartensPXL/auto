terraform {
  source = "../../../modules/asg"
}

include {
  path = find_in_parent_folders()
}

dependency "frontend_sg" {
  config_path = "../frontend_sg"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "frontend_alb" {
  config_path = "../frontend_alb"
}

dependency "ssh_sg" {
  config_path = "../ssh_sg"
}

dependency "backend_alb" {
  config_path = "../backend_alb"
}

inputs = {
  name             = "production-frontend"
  image_id         = "ami-005be369bee339ad9"
  security_groups  = [dependency.frontend_sg.outputs.security_group_id, dependency.ssh_sg.outputs.security_group_id]
  iam_instance_profile_name = "production-frontend"
  vpc_zone_identifier       = dependency.vpc.outputs.public_subnets
  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 2
  health_check_type         = "ELB"
  health_check_grace_period = 800
  target_group_arns         = [dependency.frontend_alb.outputs.target_group_arn]
  key_name                  = "production-frontend"

  user_data = <<EOF
    #!/bin/bash
    sudo echo "export const environment = {production: true, apiurl: 'http://${dependency.backend_alb.outputs.alb_dns_name}:3000'};" > ~/CloudToDoApp/frontend/src/environments/environment.prod.ts
    sudo echo "export const environment = {production: false, apiurl: 'http://${dependency.backend_alb.outputs.alb_dns_name}:3000'};" > ~/CloudToDoApp/frontend/src/environments/environment.ts
    cd ~/CloudToDoApp/frontend
    sudo npm run build --configuration=production
    sudo mv nginx.conf /etc/nginx/nginx.conf
    sudo cp -r dist/frontend/. /usr/share/nginx/html
    sudo systemctl enable nginx
    sudo systemctl start nginx
  EOF
}