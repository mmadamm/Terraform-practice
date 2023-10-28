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
