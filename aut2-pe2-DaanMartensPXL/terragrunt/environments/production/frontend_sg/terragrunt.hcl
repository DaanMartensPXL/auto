terraform {
  source = "../../../modules/sg"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name             = "production-frontend-sg"
  description      = "frontend loadbalancer security group"
  vpc_id           = dependency.vpc.outputs.vpc_id
  ingress_ports    = [80, 443, 3000, 4200]
  egress_ports     = [80, 443, 3000, 4200]
  name_tag         = "production-frontend-sg"
}

dependency "vpc" {
  config_path = "../vpc"
}