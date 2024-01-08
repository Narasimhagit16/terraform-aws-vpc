variable "instances" {
    type = list
    default = ["mongodb" , "mysql", "redis", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "dispatch", "web" ]
  
}

variable "ami-id" {
    default = "ami-03265a0778a880afb"
  
}

variable "zone-id" {
  
  default = "Z0601407A5EHLIBKCO7P"
}