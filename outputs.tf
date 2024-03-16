output "database_endpoint" {
  description = "The endpoint for the RDS cluster"
  value = aws_db_instance.is-my-burguer.endpoint
  sensitive = true
}

output "database_endpoint_host" {
  description = "The address for the RDS cluster"
  value = aws_db_instance.is-my-burguer.address
  sensitive = true
}

output "database_endpoint_port" {
  description = "The port for the RDS cluster"
  value = aws_db_instance.is-my-burguer.port
  sensitive = true
}

output "database_instance" {
  description = "The name for the RDS cluster"
  value = aws_db_instance.is-my-burguer.db_name
  sensitive = true
}

