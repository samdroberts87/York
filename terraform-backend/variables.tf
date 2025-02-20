variable "aws_region" {
  description = "The AWS region for the S3 bucket"
  type        = string
  default     = "eu-west-2"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
  default     = "york-demo-tf-state-bucket-storage"
}
