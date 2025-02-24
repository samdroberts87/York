run "validate_vpc__cidr_config" {
  command = plan

  assert {
    condition     = aws_vpc.main.cidr_block == "10.0.0.0/16"
    error_message = "VPC CIDR block is incorrect"
  }

  assert {
    condition     = aws_subnet.public.cidr_block == "10.0.1.0/24"
    error_message = "Public subnet CIDR block is incorrect"
  }

  assert {
    condition     = aws_subnet.private.cidr_block == "10.0.2.0/24"
    error_message = "Private subnet CIDR block is incorrect"
  }
}