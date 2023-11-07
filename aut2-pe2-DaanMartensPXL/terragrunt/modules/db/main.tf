resource "aws_db_instance" "database" {
  allocated_storage         = var.allocated_storage
  db_name                   = var.db_name
  engine                    = var.engine
  engine_version            = var.engine_version
  instance_class            = var.instance_class
  username                  = var.username
  password                  = var.password
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = var.skip_final_snapshot
  identifier                = var.identifier
  vpc_security_group_ids    = var.vpc_security_group_ids
  db_subnet_group_name      = var.db_subnet_group_name
  availability_zone         = var.availability_zones[0]
}