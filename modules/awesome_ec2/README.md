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
| [aws_iam_instance_profile.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_iam_policy.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | ID of AMI to use for the instance initialization | `string` | `""` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ to start the instance in | `string` | `null` | no |
| <a name="input_create_ec2"></a> [create\_ec2](#input\_create\_ec2) | Controls if EC2 should be created (it affects almost all resources) | `bool` | `true` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Env name for EC2 instance tag | `string` | `"staging"` | no |
| <a name="input_iam_path"></a> [iam\_path](#input\_iam\_path) | Path in which to create the IAM Role and the IAM Policy. | `string` | `"/"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance EC2 to start | `string` | `"t2.micro"` | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | SSH Key pair name to ingest into EC2 instance | `string` | `"AwesomeProject"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS Key ID for CloudWatch | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on EC2 instance created | `string` | `""` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | S3 Bucket Name for CloudWatch | `string` | `"awesome-terraform-state-bucket"` | no |
| <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix) | S3 Bucket Key Prefix for CloudWatch | `string` | `"cloudwatch"` | no |
| <a name="input_ssm_document_name"></a> [ssm\_document\_name](#input\_ssm\_document\_name) | The name of the document for SSM | `string` | `"SSM-SessionManagerRunShell"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The VPC Subnet ID to launch in | `list(any)` | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Bootstrap script for EC2 instance | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | A list of security group IDs to associate with EC2 instance | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instance_ids"></a> [ec2\_instance\_ids](#output\_ec2\_instance\_ids) | New EC2 instances IDs |
| <a name="output_iam_role_id"></a> [iam\_role\_id](#output\_iam\_role\_id) | Created IAM roles for the SSM |
| <a name="instance_private_ip"></a> [instance\_private\_ip](#output\_instance\_private\_ip) | Associated Private IP with EC2 instances |