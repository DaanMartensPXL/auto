terraform {
  source = "../../../modules/alb"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "backend_sg_lb" {
  config_path = "../backend_sg_lb"
}

inputs = {
  name        = "production-backend"
  tg_port     = 3000
  vpc_id      = dependency.vpc.outputs.vpc_id
  lb_sg       = [dependency.backend_sg_lb.outputs.security_group_id]
  lb_subnets  = dependency.vpc.outputs.public_subnets
  lb_port     = 3000
}