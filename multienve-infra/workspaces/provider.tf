terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  backend "s3" {
    bucket = "nari-terraform-workspace-state-file"
    key    = "workspace"
    region = "us-east-1"
    dynamodb_table = "workspace-state-lock"
  }


}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

