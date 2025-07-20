provider "aws" {
  region = "us-east-1" # adjust as needed
}

resource "aws_s3_bucket" "tf_backend" {
  bucket        = "terraform-sre-micro-1176" # must be globally unique
  force_destroy = true

  tags = {
    Name        = "terraform-backend"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.tf_backend.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
