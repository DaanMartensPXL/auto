terraform {
  source = "../../../modules/sg_ssh"
}

include {
  path = find_in_parent_folders()
}

inputs = {
    name             = "staging-ssh-sg"
    description      = "ssh security group"
    vpc_id           = dependency.vpc.outputs.vpc_id
    name_tag         = "staging-ssh-sg"
}

dependency "vpc" {
  config_path = "../vpc"
}