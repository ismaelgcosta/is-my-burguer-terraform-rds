provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name                 = "ismyburguer"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets       = ["10.0.5.0/24", "10.0.6.0/24"]
  # rds require at least 2 subnet to launch an instance
  private_subnets      = ["10.0.3.0/24", "10.0.4.0/24"]

  create_database_subnet_group           = true
  create_database_internet_gateway_route = true

  enable_dns_hostnames = true
  enable_dns_support   = true
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

resource "aws_db_instance" "is-my-burguer" {
  allocated_storage    = 5
  storage_type         = "gp2"
  instance_class       = "db.t3.micro"
  identifier           = "is-my-burguer"
  engine               = "postgres"
  engine_version       = "16.2"
  parameter_group_name = "default.postgres16"
 
  db_name  = "ismyburguer"
  username = "${var.TF_VAR_POSTGRES_USER}"
  password = "${var.TF_VAR_POSTGRES_PASSWORD}"

  port = 5433

  vpc_security_group_ids = [aws_security_group.postgres.id]
  publicly_accessible    = true # Only for testing!
  skip_final_snapshot    = true
}
