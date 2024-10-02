terraform {
  backend "s3" {
    bucket = ""
    dynamodb_table = ""
    key = ""
    region= ""
    
  }
  required_providers {
    databricks = {
      source = "databricks/databricks"
      version = "~> 1.35.0"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
  #access_key = var.access_key
  #secret_key = var.secret_key
}

provider "databricks" {
  host          = "https://accounts.cloud.databricks.com"
  account_id    = var.databricks_account_id
  client_id     = var.client_id
  client_secret = var.client_secret
}