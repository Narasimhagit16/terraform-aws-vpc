variable "instance" {
    default = {
        web = "t2.micro"
        catalogue = "t2.micro"
        cart = "t2.micro"
        mongodb = "t3.small"
        user = "t2.micro"
        mysql = "t3.small"
    }
  
}

variable "ami-id" {
    default = "ami-03265a0778a880afb"
  
}

variable "zone-id" {
  
  default = "Z0601407A5EHLIBKCO7P"
}