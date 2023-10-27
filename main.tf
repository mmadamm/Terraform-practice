provider "aws" {
  region = "us-west-2"
  
}



module "iam" {
  source = "./iam-module"

  #variables:

 
}

module "vpc" {
  source = "./vpc-module"
 
   #variables:
   vpc-cider = "10.16.0.0/16"
   subnets_cidr_blocks = "10.16.0.0/20"
   azs ="us-west-2d"
   

}

module "efs" {
  source = "./efs-module"
 
  #variables:

}

module "asg" {
  source = "./asg-module"

  #variables:

  
}

