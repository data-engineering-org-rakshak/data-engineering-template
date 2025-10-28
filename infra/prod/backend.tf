terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"   # central state bucket
    key    = "data-engineering/prod/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
