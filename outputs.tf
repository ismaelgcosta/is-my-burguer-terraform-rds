output "database_endpoint" {
  description = "The endpoint for the RDS cluster"
  value = aws_db_instance.is-my-burguer.endpoint
}
