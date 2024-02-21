output "cluster_endpoint" {
  description = "The endpoint for the RDS cluster"
  value = aws_rds_cluster.cluster.endpoint
}

output "cluster_read_endpoint" {
  description = "The read endpoint for the RDS cluster"
  value = aws_rds_cluster.cluster.reader_endpoint
}
