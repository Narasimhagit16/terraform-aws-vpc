resource "aws_instance" "web" { # terraform resource name = web
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]


  tags = {
    Name = "HelloWorld"    # aws resource name
  }

connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }

provisioner "remote-exec" {
    inline = [ 
        "echo 'this is remote exec' > /tmp/temp.txt",
        "sudo yum install nginx -y",
        "sudo systemctl start nginx"

     ]
  
}
}

resource "aws_security_group" "allow_tls" {
  name        = "allow-all"
  description = "allow-all"
  #vpc_id      = aws_vpc.main.id

  ingress {

    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

}

  ingress {

    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

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

