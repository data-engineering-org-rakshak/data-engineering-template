output "bucket_name" {
  value = aws_s3_bucket.iac_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.iac_bucket.arn
}
