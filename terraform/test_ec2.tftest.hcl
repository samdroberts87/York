run "validate_ec2_ami" {
    command = plan

    assert {
      condition     = aws_instance.public.ami == "ami-091f18e98bc129c4e"
      error_message = "this is not the correct instance type"
    }

    assert {
      condition     = aws_instance.private.ami == "ami-091f18e98bc129c4e"
      error_message = "this is not the correct instance type"
    }
}