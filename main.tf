# This code tells AWS to create a storage box (S3 Bucket)
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-very-awesome-devsecops-test-bucket"
}

# SECURITY FLAW: Making the bucket completely public to the whole internet!
resource "aws_s3_bucket_public_access_block" "insecure_example" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
