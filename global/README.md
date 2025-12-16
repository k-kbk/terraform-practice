<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | 6.26.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.atlantis_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.atlantis_eip_assoc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_iam_instance_profile.atlantis_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.atlantis_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.atlantis_admin_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.atlantis_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.mgmt_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.mgmt_public_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.mgmt_public_rta](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.atlantis_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.atlantis_egress_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.atlantis_egress_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.atlantis_ingress_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.atlantis_ingress_web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.mgmt_public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.mgmt_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_ssh_cidr"></a> [allowed_ssh_cidr](#input_allowed_ssh_cidr) | Allowed SSH CIDR | `string` | `"0.0.0.0/0"` | no |
| <a name="input_gh_token"></a> [gh_token](#input_gh_token) | GitHub personal access token | `string` | n/a | yes |
| <a name="input_gh_user"></a> [gh_user](#input_gh_user) | GitHub username | `string` | n/a | yes |
| <a name="input_gh_webhook_secret"></a> [gh_webhook_secret](#input_gh_webhook_secret) | GitHub webhook secret | `string` | n/a | yes |
| <a name="input_public_subnet_cidr"></a> [public_subnet_cidr](#input_public_subnet_cidr) | Public subnet CIDR | `string` | `"192.168.1.0/24"` | no |
| <a name="input_region"></a> [region](#input_region) | AWS region | `string` | `"ap-northeast-2"` | no |
| <a name="input_repo_allowlist"></a> [repo_allowlist](#input_repo_allowlist) | Atlantis allowlisted repositories | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr) | VPC CIDR | `string` | `"192.168.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_atlantis_url"></a> [atlantis_url](#output_atlantis_url) | Atlantis Payload URL |
| <a name="output_atlantis_web_url"></a> [atlantis_web_url](#output_atlantis_web_url) | Atlantis Web URL |
<!-- END_TF_DOCS -->