terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "break-the-monolith"
    key    = "terraform.tfstate"
  }
}