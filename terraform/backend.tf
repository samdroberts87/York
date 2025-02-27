terraform {
  backend "s3" {
    bucket  = "yorkshire-demo-tf-state-bucket-storage"
    key     = "terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
    use_lockfile = true
  }
}