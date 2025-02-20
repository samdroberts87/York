resource "aws_instance" "public" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.web_sg.id]
  key_name        = "york"

  tags = {
    Name = "yorkDemoPublicServer"
  }
}

resource "aws_instance" "private" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.private_sg.id]
  key_name        = "york-private"

  tags = {
    Name = "yorkDemoPrivateServer"
  }
}
