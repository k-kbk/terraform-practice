terraform {
  backend "s3" {
    bucket       = "kkbk-tf-state-bucket"
    key          = "global/terraform.tfstate"
    region       = "ap-northeast-2"
    encrypt      = true
    use_lockfile = true
  }
}
