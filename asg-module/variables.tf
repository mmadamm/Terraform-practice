
#luanch template variables

variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "image_id" {
  type = string
  default = "ami-0dbc3d7bc646e8516"
}

variable "vpc-id" {
  type = string
}

variable "efs_dns_name" {
  type = string
  
}


#security group variables 
variable "ingress_ports" {
  description = "List of ingress port configurations"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    # Add more port configurations as needed
  ]
}


#autoscaling group variables

variable "azs" {
  type = list(string)
}

variable "subnets" {
  type = list(string)
  
}



