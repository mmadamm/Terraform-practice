#account login outputs

output "accountID" {

  value =module.iam.accountID
  
}
output "username" {
  value=module.iam.user_name
}

output "passs" {

  value = module.iam.usernamepass
  
}

output "aws_autoscaling_group" {
  value = module.asg.aws_autoscaling_group  
}

