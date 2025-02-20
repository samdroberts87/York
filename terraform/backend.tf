terraform {
  backend "s3" {
    bucket  = "york-demo-tf-state-bucket-storage"
    key     = "terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}