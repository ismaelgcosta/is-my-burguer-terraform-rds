terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.33"
    }
  }

  cloud {
    organization = "ismaelcosta1000"

    workspaces {
      name = "postgres-is-my-burguer"
    }
  }

}
