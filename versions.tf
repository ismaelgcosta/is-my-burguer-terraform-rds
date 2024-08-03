# Configure the MongoDB Atlas Provider 
provider "mongodbatlas" {
  public_key = var.TF_VAR_MONGODB_ATLAS_API_PUB_KEY
  private_key  = var.TF_VAR_MONGODB_ATLAS_API_PRI_KEY
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      version = "~> 5.61.0"
    }

    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.17.3"
    }

  }

  cloud {
    organization = "is-my-burguer"

    workspaces {
      name = "is-my-burguer-db"
    }
  }

}
