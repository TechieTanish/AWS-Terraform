terraform {

    backend "s3" {
    bucket = "tejas-learning-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#create S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "tejas-bucket-12345"

  tags = {
    Name        = "My bucket 2.O"
    Environment = "Dev"
  }
}