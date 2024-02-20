provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "postgres" {
  name        = "postgres-security-group"
  description = "Security group for Postgres database"
 
  ingress {
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5433
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_rds_cluster" "cluster" {
  engine                  = "aurora-postgresql"
  engine_mode             = "provisioned"
  engine_version          = "14.6"
  cluster_identifier      = "ismyburguer"
  master_username         = "ismyburguer"
  master_password         = "ismyburguer"

  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  
  backup_retention_period = 7
  skip_final_snapshot     = true
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  identifier         = "ismyburguer-${count.index}"
  count              = 1
  cluster_identifier = aws_rds_cluster.cluster.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.cluster.engine
  engine_version     = aws_rds_cluster.cluster.engine_version
  publicly_accessible    = true # Only for testing!
  skip_final_snapshot    = true
}

output "rds_address" {
  description = "RDS address"
  value       = aws_rds_cluster_instance.cluster_instances.address
}
