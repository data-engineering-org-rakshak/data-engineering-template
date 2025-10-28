terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "ap-south-1" # or your desired AWS region
}

resource "aws_s3_bucket" "example" {
  bucket = "rocky-dev-bucket-${random_id.suffix.hex}"
  tags = {
    Environment = "dev"
    Project     = "DataEngineeringTemplate"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}
