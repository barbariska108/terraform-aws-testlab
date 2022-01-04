## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.70.0+ |



## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_instance_profile.ssm_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ssm_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm_role_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.future_ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_iam_policy.AmazonSSMManagedInstanceCore](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | ID of AMI to use for the instance initialization | `string` | `""` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ to start the instance in | `string` | `null` | no |
| <a name="input_create_ec2"></a> [create\_ec2](#input\_create\_ec2) | Controls if EC2 should be created (it affects almost all resources) | `bool` | `true` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Env name for EC2 instance tag | `string` | `"staging"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance EC2 to start | `string` | `"t2.micro"` | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | SSH Key pair name to ingest into EC2 instance | `string` | `"AwesomeProject"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS Key ID for CloudWatch | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on EC2 instance created | `string` | `""` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The VPC Subnet ID to launch in | `list(any)` | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Bootstrap script for EC2 instance | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | A list of security group IDs to associate with EC2 instance | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instance_ids"></a> [ec2\_instance\_ids](#output\_ec2\_instance\_ids) | New EC2 instances IDs |