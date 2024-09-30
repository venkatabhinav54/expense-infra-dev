terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  backend "s3" {
    bucket = "dev-1289"
    key    = "expense-sg-dev"
    region = "us-east-1"
    dynamodb_table = "dev-table"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}