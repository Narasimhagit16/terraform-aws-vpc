
resource "aws_instance" "web" {
    for_each = var.instance
    ami = var.ami-id
    instance_type = each.value

    tags = {
      Name = each.key
    }

}

resource "aws_route53_record" "www" {
#   count = 11
  for_each = aws_instance.web
  zone_id = var.zone-id
  name    = "${each.key}.nariops.online"
  type    = "A"
  ttl     = 1
  records = each.key == "web" ? [each.value.public_ip] : [each.value.private_ip]
}


# output "instace-info" {
#     value = aws_instance.web
  
# }