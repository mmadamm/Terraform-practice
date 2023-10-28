
output "accountID" {
  value = data.aws_caller_identity.current
}

output "user_name" {
  value = aws_iam_user.user.name
}

output "group_name" {
  value = aws_iam_group.group.name
}

output "usernamepass" {

  value = aws_iam_user_login_profile.login.password
  
}


