terraform {
  source = "../../../modules/vpc"
}

inputs = {
  vpc_name                   = "staging-vpc"
  private_subnets_cidr_blocks = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets_cidr_blocks  = ["10.0.64.0/19", "10.0.96.0/19"]
  name_db_subnet_group        = "staging-db-subnet-group"
}

include {
  path = find_in_parent_folders()
}