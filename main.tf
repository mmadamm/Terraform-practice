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


}

#============================================== vpc-module ===================================================#

module "vpc" {
  source = "./vpc-module"

  #variables:

}

#============================================== efs-module ===================================================#


module "efs" {
  source = "./efs-module"

  #variables:
  vpc-id  = module.vpc.vpc_id
  subnets = module.vpc.subnet_id

}

#============================================== asg-module ===================================================#


module "asg" {
  source = "./asg-module"

  #variables:
  vpc-id       = module.vpc.vpc_id
  azs          = data.aws_availability_zones.azs.names
  subnets      = module.vpc.subnet_id
  efs_dns_name = module.efs.efs_dns_name



}

  

#============================================== The-End ======================================================#


