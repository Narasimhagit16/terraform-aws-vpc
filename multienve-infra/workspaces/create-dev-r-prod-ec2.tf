resource "aws_instance" "web" { # terraform resource name = web
  ami           = "ami-03265a0778a880afb"
  #instance_type = "t2.micro"
  instance_type = lookup(var.instance_type, terraform.workspace)
  tags = {
    Name = "web-instance"    # aws resource name
  }
}