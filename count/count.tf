
resource "aws_instance" "web" { # terraform resource name = web
#   count=11
  count = length(var.instances)
  ami           = var.ami-id
  instance_type =  var.instances[count.index] == "mongodb" || var.instances[count.index] == "mysql" || var.instances[count.index] == "shipping" ? "t3.small" : "t2.micro"

  tags = {
    Name = var.instances[count.index]   # aws resource name
  }

}

resource "aws_route53_record" "www" {
#   count = 11
count = length(var.instances)
  zone_id = var.zone-id
  name    = "${var.instances[count.index]}.nariops.online"
  type    = "A"
  ttl     = 1
  records =   var.instances[count.index] == "web" ? [aws_instance.web[count.index].public_ip] : [aws_instance.web[count.index].private_ip]
}
