provider "aws" {
  region = "us-east-1"

}

data "aws_availability_zones" "azs" {
    state = "available"
}




#============================================== iam-module ===================================================#

module "iam" {
  source = "./iam-module"
  #variables:
  user_name  = ""
  group_name = ""
  tags       = {}

}

#============================================== vpc-module ===================================================#

module "vpc" {
  source = "./vpc-module"
  #variables:
  vpc-cider                  = ""
  public_subnets_cidr_blocks = {}
  map_public_ip_on_launch    = ""
  tags                       = {}

}

#============================================== efs-module ===================================================#


module "efs" {
  source = "./efs-module"

  # static variables:    #dont change them if you want to run this project
  vpc-id  = module.vpc.vpc_id
  subnets = module.vpc.subnet_id

  #user inputs variables
  performance_mode  = ""
  throughput_mode   = ""
  encryption        = ""
  tags              = {}  


}

#============================================== asg-module ===================================================#


module "asg" {
  source = "./asg-module"

  #static variables:    #dont change them if you want to run this project
  vpc-id       = module.vpc.vpc_id
  azs          = data.aws_availability_zones.azs.names
  subnets      = module.vpc.subnet_id
  efs_dns_name = module.efs.efs_dns_name

  #user inputs variables for luanch template

  instance_type    = ""
  image_id         = ""

  #security group 
  ingress_ports    = {}


  #autoscaling group variables
  min_size         = ""
  max_size         = ""
  desired_capacity = ""
}



#============================================== The-End ======================================================#


