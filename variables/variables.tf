variable "instance-type" {
    type = string
    default = "web"
  
}

variable "ami-id" {
    type = string
    default = "ami-03265a0778a880afb"
  
}

variable "sg-name" {
type = string
default = "allow-all"
  
}

variable "sg-description" {
    type = string
    default = "Allow TLS inbound traffic"
  
}

variable "sg-from-port" {
    type = number
    default = 0
      
}

variable "sg-to-port" {
    type = number
    default = 0
      
}

variable "sg-cidr" {
  type = list
  default = ["0.0.0.0/0"]

}