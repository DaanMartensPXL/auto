terraform {
  source = "../../../modules/sg"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name             = "production-db-sg"
  description      = "database security group"
  vpc_id           = dependency.vpc.outputs.vpc_id
  ingress_ports    = [3306]
  egress_ports     = [3306]
  cidr_blocks      = [dependency.vpc.outputs.vpc_cidr_block]
  name_tag         = "production-db-sg"
}

dependency "vpc" {
  config_path = "../vpc"
}