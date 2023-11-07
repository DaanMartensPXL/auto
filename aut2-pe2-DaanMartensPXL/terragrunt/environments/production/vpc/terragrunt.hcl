terraform {
  source = "../../../modules/vpc"
}

inputs = {
  vpc_name                    = "production-vpc"
  private_subnets_cidr_blocks = ["10.0.0.0/18", "10.0.64.0/18"]
  public_subnets_cidr_blocks  = ["10.0.128.0/18", "10.0.192.0/18"]
  name_db_subnet_group        = "production-db-subnet-group"
}

include {
  path = find_in_parent_folders()
}