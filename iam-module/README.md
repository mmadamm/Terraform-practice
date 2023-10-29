## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.user_group_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_login_profile.login](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Name of the IAM group | `string` | `"DevOps"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to IAM resources | `map(string)` | <pre>{<br>  "company": "fawry",<br>  "team": "devops"<br>}</pre> | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Name of the IAM user | `string` | `"Adam"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_accountID"></a> [accountID](#output\_accountID) | n/a |
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | n/a |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | n/a |
| <a name="output_usernamepass"></a> [usernamepass](#output\_usernamepass) | n/a |
