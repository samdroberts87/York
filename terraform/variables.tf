variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "eu-west-2"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

