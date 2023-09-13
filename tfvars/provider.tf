terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }

  backend "s3" {
    bucket   = "roboshop1-remote-state"
    key = "tfvars"
    region = "us-east-1"
    dynamodb_table = "roboshop-state-lock"
  }

}

provider "aws" {
  # Configuration options
  # you can give access key and secret key here, but security problem
  region = "us-east-1"
}