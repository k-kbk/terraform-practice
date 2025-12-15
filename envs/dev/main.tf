provider "aws" {
  region = "ap-northeast-2"
}

module "s3_bucket" {
  source = "../../modules/simple_bucket"

  bucket_name = "test-ci-bucket-2025-12-15"
}
