<!-- BEGIN_TF_DOCS -->

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 6.26.0  |

## Resources

| Name                                                                                                                                                   | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [aws_cloudwatch_log_group.nginx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group)                     | resource |
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster)                                        | resource |
| [aws_ecs_service.nginx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service)                                       | resource |
| [aws_ecs_task_definition.nginx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition)                       | resource |
| [aws_iam_role.ecs_execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                     | resource |
| [aws_iam_role_policy_attachment.ecs_execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                              | resource |
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb)                                                          | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener)                                        | resource |
| [aws_lb_target_group.nginx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group)                               | resource |
| [aws_route.public_internet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route)                                         | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                                      | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)              | resource |
| [aws_security_group.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                   | resource |
| [aws_security_group.service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                               | resource |
| [aws_security_group_rule.alb_egress_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)             | resource |
| [aws_security_group_rule.alb_egress_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)            | resource |
| [aws_security_group_rule.alb_ingress_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)            | resource |
| [aws_security_group_rule.service_egress_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)         | resource |
| [aws_security_group_rule.service_egress_https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)        | resource |
| [aws_security_group_rule.service_ingress_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule)         | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                                | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                                        | resource |

## Inputs

| Name                                                                                             | Description                                        | Type     | Default            | Required |
| ------------------------------------------------------------------------------------------------ | -------------------------------------------------- | -------- | ------------------ | :------: |
| <a name="input_container_image"></a> [container_image](#input_container_image)                   | Container image to deploy on ECS                   | `string` | `"nginx:latest"`   |    no    |
| <a name="input_desired_count"></a> [desired_count](#input_desired_count)                         | Desired number of ECS tasks                        | `number` | `1`                |    no    |
| <a name="input_environment"></a> [environment](#input_environment)                               | Environment name (e.g., dev, staging, prod)        | `string` | `"dev"`            |    no    |
| <a name="input_log_retention_days"></a> [log_retention_days](#input_log_retention_days)          | Retention in days for application CloudWatch Logs  | `number` | `14`               |    no    |
| <a name="input_project_name"></a> [project_name](#input_project_name)                            | Project or workload name                           | `string` | `"nginx"`          |    no    |
| <a name="input_public_subnet_count"></a> [public_subnet_count](#input_public_subnet_count)       | Number of public subnets to create                 | `number` | `2`                |    no    |
| <a name="input_public_subnet_newbits"></a> [public_subnet_newbits](#input_public_subnet_newbits) | New bits for calculating public subnet CIDR blocks | `number` | `4`                |    no    |
| <a name="input_region"></a> [region](#input_region)                                              | AWS region for this environment                    | `string` | `"ap-northeast-2"` |    no    |
| <a name="input_task_cpu"></a> [task_cpu](#input_task_cpu)                                        | CPU units to allocate for the ECS task             | `number` | `256`              |    no    |
| <a name="input_task_memory"></a> [task_memory](#input_task_memory)                               | Memory (MB) to allocate for the ECS task           | `number` | `512`              |    no    |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr)                                        | CIDR range for the VPC                             | `string` | `"10.0.0.0/16"`    |    no    |

## Outputs

| Name                                                                    | Description                                              |
| ----------------------------------------------------------------------- | -------------------------------------------------------- |
| <a name="output_alb_dns_name"></a> [alb_dns_name](#output_alb_dns_name) | DNS name of the Application Load Balancer to reach nginx |

<!-- END_TF_DOCS -->
