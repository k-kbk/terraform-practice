provider "aws" {
  region = "ap-northeast-2"
}

# Test
resource "null_resource" "hello_atlantis" {
  triggers = {
    value = "Test Atlantis"
  }
}
