terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
    random = { source = "hashicorp/random" }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type = string
  default = "us-west-2"
}

variable "environment" {
  type = string
  default = "staging"
}

variable "bucket_prefix" {
  type = string
  default = "dataeng-iac-bucket"
}


resource "random_id" "suffix" { byte_length = 4 }

resource "aws_s3_bucket" "data_bucket" {
  bucket = "${var.bucket_prefix}-${var.environment}-${random_id.suffix.hex}"
  tags = {
    Environment = var.environment
    Project     = "data-engineering-template"
  }
}

output "bucket_name" { value = aws_s3_bucket.data_bucket.bucket }
