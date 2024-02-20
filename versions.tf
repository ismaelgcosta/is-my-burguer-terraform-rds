terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.33"
    }
  }

  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "ismaelcosta1000"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "postgres-is-my-burguer"
    }
  }
}
