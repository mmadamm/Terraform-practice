
module "iam" {
  source = "./iam-module"
 
}

module "vpc" {
  source = "./vpc-module"
 
}

module "efs" {
  source = "./efs-module"
 
}

module "asg" {
  source = "./asg-module"
  
}

