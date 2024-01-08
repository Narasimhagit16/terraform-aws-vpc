resource "aws_instance" "web" { # terraform resource name = web
  ami           = var.ami-id
  instance_type = var.instance-type == "web" ? "t2.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]


  tags = {
    Name = "web"    # aws resource name
  }
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg-name
  description = var.sg-description
  #vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.sg-from-port
    to_port          = var.sg-from-port
    protocol         = "tcp"
    cidr_blocks      = var.sg-cidr
 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
