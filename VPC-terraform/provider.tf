terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }

  backend "s3" {
    bucket = "roboshop1-remote-state"
    key    = "vpc-demo"
    region = "us-east-1"
    dynamodb_table = "roboshop-state-lock" 
}
}



provider "aws" {
  # Configuration options
  region = "us-east-1"
}