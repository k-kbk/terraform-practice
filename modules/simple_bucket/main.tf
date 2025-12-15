resource "aws_s3_bucket" "this" {
  bucketname = var.bucket_name

  tags = {
    Name        = "test-bucket"
    Environment = "Dev"
  }
}
