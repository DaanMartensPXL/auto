terraform {
  source = "../../../modules/alb"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "frontend_sg_lb" {
  config_path = "../frontend_sg_lb"
}

dependency "backend_asg" {
  config_path = "../backend_asg"
  skip_outputs = true
}

inputs = {
  name        = "staging-frontend"
  tg_port     = 80
  vpc_id      = dependency.vpc.outputs.vpc_id
  lb_sg       = [dependency.frontend_sg_lb.outputs.security_group_id]
  lb_subnets  = dependency.vpc.outputs.public_subnets
  lb_port     = 80
}
