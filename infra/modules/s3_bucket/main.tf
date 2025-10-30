resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "iac_bucket" {
  bucket = "${var.bucket_prefix}-${var.env_name}-${random_id.suffix.hex}"

  tags = {
    Name        = "${var.env_name}-iac-s3-bucket"
    Environment = var.env_name
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "iac_versioning" {
  bucket = aws_s3_bucket.iac_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# main.tf

resource "aws_s3_bucket" "backup" {
  bucket = "rocky-backup-bucket"
  tags = {
    Name        = "Backup Bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_policy" "backup_policy" {
  bucket = aws_s3_bucket.backup.id
  policy = data.aws_iam_policy_document.backup.json
  depends_on = [aws_s3_bucket.backup]
}

data "aws_iam_policy_document" "backup" {
  statement {
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.backup.arn}/*"]

    # Replace this part 👇
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::491074939065:user/image-pipeline-user"]
    }
  }
}

