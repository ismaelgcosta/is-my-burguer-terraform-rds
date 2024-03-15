output "database_endpoint" {
  description = "The endpoint for the RDS cluster"
  value = aws_db_instance.is-my-burguer.endpoint
}

output "database_endpoint_host" {
  description = "The address for the RDS cluster"
  value = aws_db_instance.is-my-burguer.address
}

output "database_endpoint_port" {
  description = "The port for the RDS cluster"
  value = aws_db_instance.is-my-burguer.port
}

