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
| [aws_efs_file_system.efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.efs_mount_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [aws_security_group.efs_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encryption"></a> [encryption](#input\_encryption) | define if the efs is encrypted or not | `bool` | `true` | no |
| <a name="input_performance_mode"></a> [performance\_mode](#input\_performance\_mode) | the performance mode of the efs | `string` | `"generalPurpose"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | static value for this project but you can ovverrid it | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to EFS resources | `map(string)` | <pre>{<br>  "company": "fawry",<br>  "team": "devops"<br>}</pre> | no |
| <a name="input_throughput_mode"></a> [throughput\_mode](#input\_throughput\_mode) | the thouput mode | `string` | `"bursting"` | no |
| <a name="input_vpc-id"></a> [vpc-id](#input\_vpc-id) | static value for this project but you can ovverrid it | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_dns_name"></a> [efs\_dns\_name](#output\_efs\_dns\_name) | n/a |
| <a name="output_efs_id"></a> [efs\_id](#output\_efs\_id) | n/a |
