terraform {
  source = "../../../modules/db"
}

dependency "db_sg" {
  config_path = "../db_sg"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  allocated_storage    = 20
  db_name              = "todo"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "root"
  password             = "password123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  identifier           = "todo-staging"
  publicly_accessible = false
  vpc_security_group_ids = [dependency.db_sg.outputs.security_group_id]
  db_subnet_group_name = dependency.vpc.outputs.db_subnet_group_name
  availability_zones   = dependency.vpc.outputs.azs
}

include {
  path = find_in_parent_folders()
}
