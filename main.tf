provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "postgres" {
  name        = "postgres-security-group"
  description = "Security group for Postgres database"
 
  ingress {
    protocol    = "tcp"
    from_port   = 5433
    to_port     = 5432
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "this" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "15.5"
  instance_class       = "db.t2.micro"
  name                 = "ismyburguer"
  username             = "${env.DB_USERNAME}"
  password             = "${env.DB_PASSWORD}"
  parameter_group_name = "default.postgres15"
  vpc_security_group_ids = [aws_security_group.postgres.id]
  publicly_accessible    = true # Only for testing!
  skip_final_snapshot    = true
}

output "rds_address" {
  description = "RDS address"
  value       = aws_db_instance.this.address
}
