terraform {
  source = "../../../modules/sg"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name             = "production-backend-lb-sg"
  description      = "backend loadbalancer security group"
  vpc_id           = dependency.vpc.outputs.vpc_id
  ingress_ports    = [80, 443, 3000, 4200, 3306]
  egress_ports     = [80, 443, 3000, 4200, 3306]
  name_tag         = "production-backend-lb-sg"
}

dependency "vpc" {
  config_path = "../vpc"
}