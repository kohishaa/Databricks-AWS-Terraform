terraform {
  backend "s3" {
    bucket = "dev-state-file-bucket-test"
    dynamodb_table = "dev-statelock-terraform-test"
    key = "project/databricks_dev/cloud_provider.tfstate"
    region= "us-east-1"

  }
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.35.0"
    }
    aws = {
      source  = "hashicorp/aws"
    }
  }
 
}


provider "aws" {
  region = var.region
 /*  access_key = var.access_key
  secret_key = var.secret_key */
 
  }

provider "databricks" {
  alias         = "mws"
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.client_id
  client_secret = var.client_secret
}

provider "databricks" {
  alias         = "workspace"
  host          = module.databricks_account.workspace_url
  account_id    = var.databricks_account_id
  client_id     = var.client_id
  client_secret = var.client_secret
}
