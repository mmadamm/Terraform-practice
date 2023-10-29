
#luanch template variables

variable "instance_type" {
  description = "inctance type"
  type = string
  default = "t2.micro"

}
variable "image_id" {
  description = "image id ,each region have its own ami id "
  type = string
  default = "ami-0dbc3d7bc646e8516"
}

variable "vpc-id" {
  description = "static value for this project but you can ovverrid it "
  type = string
}

variable "efs_dns_name" {
  description = "static value for this project but you can ovverrid it "
  type = string
  
}
#===================================================================#


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
#===================================================================#


#autoscaling group variables

variable "azs" {
  description = "static value for this project but you can ovverrid it "
  type = list(string)
}

variable "subnets" {
  description = "static value for this project but you can ovverrid it "
  type = list(string)
  
}
variable "min_size" {
 description = "minimum size of the ec2"
 type=number 
 default = 1
}

variable "max_size" {
 description = "max size of the ec2" 
 type=number
 default = 3 
}

variable "desired_capacity" {
 description = "desired size of the ec2"  
 type=number
 default = 2 
}

#tags

variable "tags" {
  description = "Tags to apply to ASG resources"
  type        = map(string)
  default     = {
        company="fawry"
        team   ="devops"
  }
}


