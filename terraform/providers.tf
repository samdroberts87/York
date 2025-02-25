terraform {
  required_version = "1.10.5"
}

provider "aws" {
  region = getenv("AWS_REGION")
}

