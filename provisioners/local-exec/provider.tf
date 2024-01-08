terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket = "nari-terraform-state-file"
    key    = "LockId"
    region = "us-east-1"
    dynamodb_table = "terra"
  }


}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

