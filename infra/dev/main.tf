####################################################
# Terraform: Infrastructure as Code (IaC)
# Environment: dev
# Author: Rocky 🚀
####################################################

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # (Optional) Remote backend example
  # Uncomment and update if you want to store state in S3
  #
  # backend "s3" {
  #   bucket = "rocky-terraform-state"
  #   key    = "dev/terraform.tfstate"
  #   region = "us-east-1"
  # }
}

####################################################
# AWS Provider Configuration
####################################################

provider "aws" {
  region = var.aws_region
}

####################################################
# Variables
####################################################

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "Prefix for S3 bucket name"
  type        = string
  default     = "rocky-iac-demo"
}

####################################################
# Random ID to avoid bucket name collisions
####################################################

resource "random_id" "suffix" {
  byte_length = 4
}

####################################################
# S3 Bucket Resource
####################################################

resource "aws_s3_bucket" "iac_bucket" {
  bucket = "${var.bucket_prefix}-${random_id.suffix.hex}"

  tags = {
    Name        = "Rocky IaC S3 Bucket"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

####################################################
# S3 Bucket Versioning (optional)
####################################################

resource "aws_s3_bucket_versioning" "iac_versioning" {
  bucket = aws_s3_bucket.iac_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

####################################################
# Outputs
####################################################

output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.iac_bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.iac_bucket.arn
}
