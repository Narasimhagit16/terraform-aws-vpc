variable "ingress-rules" {
    default = [
    {
        description      = "allow port 80"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] 
    },

    {
        description      = "allow port 443"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] 
    },

    {
        description      = "allow port 22"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] 
    }
]
}