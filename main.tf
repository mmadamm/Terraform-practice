provider "aws" {
  region = "us-east-1"

}

data "aws_availability_zones" "azs" {
    state = "available"

}


module "iam" {
  source = "./iam-module"

  #variables:


}

module "vpc" {
  source = "./vpc-module"

  #variables:

}

module "efs" {
  source = "./efs-module"

  #variables:
  vpc-id  = module.vpc.vpc_id
  subnets = module.vpc.subnet_id



}

module "asg" {
  source = "./asg-module"

  #variables:
  vpc-id       = module.vpc.vpc_id
  azs          = data.aws_availability_zones.azs.names
  subnets      = module.vpc.subnet_id
  efs_dns_name = module.efs.efs_dns_name



}

