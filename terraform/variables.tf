variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default = "t2.micro"
    validation {
      condition     = contains(["t2.micro", "t2.medium", "t2.large"], var.instance_type)
      error_message = "Invalid instance type! Use t2.micro,, t2.medium, or t2.large."
    }
}
