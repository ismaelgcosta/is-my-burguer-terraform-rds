provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "this" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "12.4"
  instance_class       = "db.t2.micro"
  name                 = "myEndpoint"
  username             = "${env.DB_USERNAME}"
  password             = "${env.DB_PASSWORD}"
  parameter_group_name = "default.postgres12"
  skip_final_snapshot  = true
}

provider "postgresql" {
  host            = aws_db_instance.this.address
  port            = 5432
  username        = aws_db_instance.this.username
  password        = aws_db_instance.this.password
  sslmode         = "require"
  connect_timeout = 15
}

resource "postgresql-ismyburguer" "ismyburguer" {
  name = "ismyburguer"
}

output "rds_address" {
  description = "RDS address"
  value       = aws_db_instance.this.address
}
