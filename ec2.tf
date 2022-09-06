resource "aws_instance" "EC2" {
  ami                         = var.ami
  instance_type = var.instance
  key_name                    = "key"
  security_groups             = [aws_security_group.securitygroup.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet.id



    tags = {
    Name = "nginx"

  }


}
