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
  create_database_subnet_route_table     = true
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

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "ismyburguer-db-subnet-group"
  subnet_ids = module.vpc.public_subnets
}

resource "aws_rds_cluster" "cluster" {
  engine                  = "aurora-postgresql"
  engine_mode             = "provisioned"
  engine_version          = "14.6"
  cluster_identifier      = "ismyburguer"
  master_username         = "ismyburguer"
  master_password         = "ismyburguer"
  database_name           = "ismyburguer"
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [ "${aws_security_group.postgres.id}" ]
  skip_final_snapshot    = true
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  identifier         = "ismyburguer-${count.index}"
  count              = 1
  cluster_identifier = aws_rds_cluster.cluster.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.cluster.engine
  engine_version     = aws_rds_cluster.cluster.engine_version
  db_subnet_group_name  = aws_db_subnet_group.db_subnet_group.name
  publicly_accessible  = true # Only for testing!
  apply_immediately  = true
}

output "cluster_endpoint" {
  description = "The endpoint for the RDS cluster"
  value = aws_rds_cluster.cluster.endpoint
}

output "cluster_read_endpoint" {
  description = "The read endpoint for the RDS cluster"
  value = aws_rds_cluster.cluster.reader_endpoint
}

