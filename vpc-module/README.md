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
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.router](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.my-app](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.azs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | define if a public IP is assigned to instances launched in the subnet | `bool` | `true` | no |
| <a name="input_public_subnets_cidr_blocks"></a> [public\_subnets\_cidr\_blocks](#input\_public\_subnets\_cidr\_blocks) | CIDR blocks for public subnets | `list(string)` | <pre>[<br>  "10.16.0.0/19",<br>  "10.16.32.0/19",<br>  "10.16.64.0/19",<br>  "10.16.96.0/19",<br>  "10.16.128.0/19",<br>  "10.16.160.0/19"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to ASG resources | `map(string)` | <pre>{<br>  "company": "fawry",<br>  "team": "devops"<br>}</pre> | no |
| <a name="input_vpc-cider"></a> [vpc-cider](#input\_vpc-cider) | CIDR block for the VPC | `string` | `"10.16.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | the rout table id |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | output each subnet in the vpc |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | output the vpc id |
