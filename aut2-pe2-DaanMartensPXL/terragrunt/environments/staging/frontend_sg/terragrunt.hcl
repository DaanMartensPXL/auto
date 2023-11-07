terraform {
  source = "../../../modules/sg"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name             = "staging-frontend-sg"
  description      = "frontend loadbalancer security group"
  vpc_id           = dependency.vpc.outputs.vpc_id
  ingress_ports    = [80, 443, 3000, 4200]
  egress_ports     = [80, 443, 3000, 4200]
  name_tag         = "staging-frontend-sg"
}

dependency "vpc" {
  config_path = "../vpc"
}