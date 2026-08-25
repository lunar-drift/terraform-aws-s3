# --- terraform-aws-s3.main ---

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "b" {
  count = var.bucket_versioning ? 1 : 0
  bucket = aws_s3_bucket.b.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
