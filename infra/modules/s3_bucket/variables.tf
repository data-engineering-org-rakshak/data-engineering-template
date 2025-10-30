variable "env_name" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}

variable "bucket_prefix" {
  description = "Prefix for S3 bucket name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
