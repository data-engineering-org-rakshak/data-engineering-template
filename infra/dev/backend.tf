terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket = "rocky-iac-demo-7cf7b635"
    key    = "env:/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "s3_bucket" {
  source = "../modules/s3_bucket"

  bucket_prefix = var.bucket_prefix
  environment   = var.environment
  aws_region    = var.aws_region
}

module "iam_roles" {
  source = "../modules/iam_roles"

  environment = var.environment
  aws_region  = var.aws_region
}

output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "iam_role_name" {
  value = module.iam_roles.role_name
}
