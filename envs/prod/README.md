<!-- BEGIN_TF_DOCS -->

## Providers

No providers.

## Resources

No resources.

## Inputs

| Name                                                                                             | Description                                              | Type           | Default                             | Required |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------------- | -------------- | ----------------------------------- | :------: |
| <a name="input_ami_id"></a> [ami_id](#input_ami_id)                                              | Optional AMI override                                    | `string`       | `null`                              |    no    |
| <a name="input_associate_public_ip"></a> [associate_public_ip](#input_associate_public_ip)       | Whether to associate a public IP with the instance       | `bool`         | `true`                              |    no    |
| <a name="input_environment"></a> [environment](#input_environment)                               | Environment name                                         | `string`       | `"prod"`                            |    no    |
| <a name="input_ingress_cidrs"></a> [ingress_cidrs](#input_ingress_cidrs)                         | CIDR blocks allowed to reach the instance                | `list(string)` | <pre>[<br/> "0.0.0.0/0"<br/>]</pre> |    no    |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type)                         | EC2 instance type                                        | `string`       | `"t3.small"`                        |    no    |
| <a name="input_project_name"></a> [project_name](#input_project_name)                            | Project or workload name                                 | `string`       | `"ec2-app"`                         |    no    |
| <a name="input_public_subnet_count"></a> [public_subnet_count](#input_public_subnet_count)       | Number of public subnets to create                       | `number`       | `2`                                 |    no    |
| <a name="input_public_subnet_newbits"></a> [public_subnet_newbits](#input_public_subnet_newbits) | New bits for calculating public subnet CIDR blocks       | `number`       | `4`                                 |    no    |
| <a name="input_region"></a> [region](#input_region)                                              | AWS region for this environment                          | `string`       | `"ap-northeast-2"`                  |    no    |
| <a name="input_root_volume_size"></a> [root_volume_size](#input_root_volume_size)                | Root volume size in GB                                   | `number`       | `30`                                |    no    |
| <a name="input_ssh_key_name"></a> [ssh_key_name](#input_ssh_key_name)                            | Existing SSH key pair name                               | `string`       | `null`                              |    no    |
| <a name="input_ssh_public_key"></a> [ssh_public_key](#input_ssh_public_key)                      | Public key material for registering a temporary key pair | `string`       | `null`                              |    no    |
| <a name="input_user_data"></a> [user_data](#input_user_data)                                     | User data script                                         | `string`       | `null`                              |    no    |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr)                                        | CIDR block for the VPC                                   | `string`       | `"10.40.0.0/16"`                    |    no    |

## Outputs

| Name                                                                                      | Description                       |
| ----------------------------------------------------------------------------------------- | --------------------------------- |
| <a name="output_instance_id"></a> [instance_id](#output_instance_id)                      | EC2 instance ID                   |
| <a name="output_instance_public_ip"></a> [instance_public_ip](#output_instance_public_ip) | Public IP address of the instance |
| <a name="output_security_group_id"></a> [security_group_id](#output_security_group_id)    | Security group managing ingress   |

<!-- END_TF_DOCS -->
