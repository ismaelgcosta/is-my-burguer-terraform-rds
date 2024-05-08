# Configure the MongoDB Atlas Provider 
provider "mongodbatlas" {
  public_key = var.TF_VAR_MONGODB_ATLAS_API_PUB_KEY
  private_key  = var.TF_VAR_MONGODB_ATLAS_API_PRI_KEY
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.33"
    }

    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.16.0"
    }

  }

  cloud {
    organization = "is-my-burguer"

    workspaces {
      name = "is-my-burguer-db"
    }
  }

}
