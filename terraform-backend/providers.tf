terraform {
  required_version = "1.10.5"
}

provider "aws" {
  region = var.aws_region
}