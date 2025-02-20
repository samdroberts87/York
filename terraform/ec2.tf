resource "aws_instance" "web" {
  ami           = var.ami             # Set via the environment-specific tfvars file
  instance_type = var.instance_type   # Set via the environment-specific tfvars file
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.web_sg.id]
  key_name = "york"


  tags = {
    Name = "yorkDemoWebServer"
  }
}

