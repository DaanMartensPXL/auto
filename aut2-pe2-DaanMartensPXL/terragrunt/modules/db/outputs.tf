output "db_instance_endpoint" {
  description = "The connection endpoint for the database without port."
  value       = split(":", aws_db_instance.database.endpoint)[0]
}

output "db_password" {
  description = "The database password."
  value       = var.password
}