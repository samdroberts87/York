variable "aws_region" {
  description = "AWS region to deploy resources in"
  default     = "eu-west-2"
}

variable "ssh_public_key" {
  description = "Public key for SSH access"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_pair" {
  description = "The name of the SSH key pair to use for the EC2 instance"
  type        = string
}

