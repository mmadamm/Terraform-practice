## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.ec2-launch-temp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.launch-security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [template_file.user_data_template](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | static value for this project but you can ovverrid it | `list(string)` | n/a | yes |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | desired size of the ec2 | `number` | `2` | no |
| <a name="input_efs_dns_name"></a> [efs\_dns\_name](#input\_efs\_dns\_name) | static value for this project but you can ovverrid it | `string` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | image id ,each region have its own ami id | `string` | `"ami-0dbc3d7bc646e8516"` | no |
| <a name="input_ingress_ports"></a> [ingress\_ports](#input\_ingress\_ports) | List of ingress port configurations | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 22,<br>    "protocol": "tcp",<br>    "to_port": 22<br>  },<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 2049,<br>    "protocol": "tcp",<br>    "to_port": 2049<br>  }<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | inctance type | `string` | `"t2.micro"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | max size of the ec2 | `number` | `3` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | minimum size of the ec2 | `number` | `1` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | static value for this project but you can ovverrid it | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to ASG resources | `map(string)` | <pre>{<br>  "company": "fawry",<br>  "team": "devops"<br>}</pre> | no |
| <a name="input_vpc-id"></a> [vpc-id](#input\_vpc-id) | static value for this project but you can ovverrid it | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_autoscaling_group"></a> [aws\_autoscaling\_group](#output\_aws\_autoscaling\_group) | n/a |
