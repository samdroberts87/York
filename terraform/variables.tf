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
  default = "t2.micro"
    validation {
      condition     = contains(["t2.micro", "t3.micro", "t3.medium", "t3.large"], var.instance_type)
      error_message = "Invalid instance type! Use t2.micro,, t3.micro, t3.medium, or t3.large."
    }
}

