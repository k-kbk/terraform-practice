provider "aws" {
  region     = "ap-northeast-2"
  access_key = "mock_access_key"
  secret_key = "mock_secret_key"

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

module "s3_bucket" {
  source = "../../modules/simple_bucket"

  bucket_name = "test-ci-bucket-2025-12-15"
}
