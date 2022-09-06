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
resource "aws_security_group" "securitygroup" {
  name        = "security1"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.VPC.id
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security1"
  }
}




