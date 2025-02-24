run "validate_vpc_config" {
  command = plan

  assert {
    condition     = aws_vpc.main.cidr_block == "10.0.0.0/16"
    error_message = "VPC CIDR block is incorrect"
  }

  assert {
    condition     = aws_vpc.main.enable_dns_support == true
    error_message = "VPC DNS support is not enabled"
  }

  assert {
    condition     = aws_vpc.main.enable_dns_hostnames == true
    error_message = "VPC DNS hostnames are not enabled"
  }

  assert {
    condition     = aws_subnet.public.cidr_block == "10.0.1.0/24"
    error_message = "Public subnet CIDR block is incorrect"
  }

  assert {
    condition     = aws_subnet.private.cidr_block == "10.0.2.0/24"
    error_message = "Private subnet CIDR block is incorrect"
  }

  assert {
    condition     = aws_security_group.public_sg.ingress[0].from_port == 22
    error_message = "Public security group should allow SSH on port 22"
  }

  assert {
    condition     = aws_security_group.private_sg.ingress[0].cidr_blocks[0] == aws_subnet.public.cidr_block
    error_message = "Private security group should allow SSH from public subnet"
  }
}
