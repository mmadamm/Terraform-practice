# main.tf
data "aws_caller_identity" "current" {}
resource "aws_iam_user" "user" {
  name = var.user_name

}

resource "aws_iam_group" "group" {
  name = var.group_name

}

resource "aws_iam_user_login_profile" "login" {
  user    = aws_iam_user.user.name 
}

resource "aws_iam_policy" "policy" {
  name   = var.policy_name
  policy = var.policy_document

}

resource "aws_iam_user_group_membership" "user_group_membership" {
  user   = aws_iam_user.user.name
  groups = [aws_iam_group.group.name]
}


resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}