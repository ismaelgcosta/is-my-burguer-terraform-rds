terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.33"
    }
  }

  cloud {
    organization = "is-my-burguer"

    workspaces {
      name = "is-my-burguer-postgres"
    }
  }

}
