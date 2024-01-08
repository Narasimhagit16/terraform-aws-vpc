resource "aws_instance" "web" { # terraform resource name = web
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"


  tags = {
    Name = "HelloWorld"    # aws resource name
  }
 provisioner "local-exec" {
    command = "echo th server's ip adderedd is: ${self.private_ip} "

}
}