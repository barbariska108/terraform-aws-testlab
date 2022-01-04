# Basic AWS infrastructure

It contains:

- 2 EC2 instances (in public subnet bastion, in private - app instance with Nginx Web Server)
- 2 subnets (public and private)
- VPC w/ IGW, EIP, NAT Gateway, and RT

## Modules

- awesome_ec2
It's used for EC2 Instance creation, in future it will be can create IAM policies for the SSM and CloudWatch
- awesome_vpc
This module is needed for network creation:
It contains the creation of the VPC, Elastic IP, public/private subnets, Route Table and NAT Gateway

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.70.0+ |

## Modules

| Name | Source |
|------|--------|
| <a name="module_awesome_app_ec2"></a> [awesome\_app\_ec2](#module\_awesome\_app\_ec2) | ./modules/awesome_ec2 |
| <a name="module_awesome_bastion_ec2"></a> [awesome\_bastion\_ec2](#module\_awesome\_bastion\_ec2) | ./modules/awesome_ec2 | 
| <a name="module_awesome_vpc"></a> [awesome\_vpc](#module\_awesome\_vpc) | ./modules/awesome_vpc | 

## Resources

| Name | Type |
|------|------|
| [aws_security_group.app_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.bastion_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.latest_amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="vpc_cidr"></a> [vpc_cidr](#input\_vpc_cidr) | VPC CIDR block | `string` | see locals.tf | yes |
| <a name="vpc_cidr"></a> [user_data](#input\_user_data) | Bootstrap script for EC2 Instances | `string` | see locals.tf | yes |
| <a name="vpc_cidr"></a> [priavte_subnets](#input\_private_subnets) | CIDR/CIDR's blocks for private subnet | `list(any)` | see locals.tf | yes |
| <a name="vpc_cidr"></a> [public_subnets](#input\_public_subnets) | CIDR/CIDR's blocks for public subnet | `list(any)` | see locals.tf | yes |
| <a name="vpc_cidr"></a> [common_tags](#input\_common_tags) | CIDR/CIDR's blocks for private subnet | `list(any)` | see locals.tf | yes |



## Outputs

| Name | Description |
|------|-------------|
| <a name="output_current_aws_ami"></a> [current\_aws\_ami](#output\_current\_aws\_ami) | Current AMI in use |
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | EC2 Instances IDs |
| <a name="output_private_subnets_id"></a> [private\_subnets\_id](#output\_private\_subnets\_id) | Public Subnets ID |
| <a name="output_public_subnets_id"></a> [public\_subnets\_id](#output\_public\_subnets\_id) | Public Subnets ID |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID |


## How-to use on the local machine

Just clone this repo, copy a module directory contents. 
And check an example usage of these modules (see [main.tf file](main.tf)).

## Main TestLab task

Create the next infrastructure in AWS using Terraform:

Non-default VPC with:

  - - [x] 1 public subnet
  - - [x] 1 private subnet
  - - [x] 1 Internet gateway
  - - [x] 1 NAT gateway

2 EC2 instances (free tier) (AMI: Amazon Linux 2 latest):

- - [x] 1 instance in the private subnet (install Nginx) - should be non-accessible from the Internet
  - - [x] 1 instance(Bastion) in public subnet should be allowed only ssh access from the Internet
  - - [x] 2 instances should have Internet access
- You should have a possibility to reach the Webpage of Nginx on your local machine from private EC2 instances through Bastion

- Create 2 Cloudwatch log groups and logging data from /var/log/secure of each EC2 to related Cloudwatch log group
- Create and use your own Terraform modules in your code.
- Use S3 Bucket for keeping terraform state there.

- Enable S3 Versioning for it.
Use Session Manager access to Bastion instead of PEM Keys.
Create README.md – with Prerequisites, Description which describe each module, and how to run on the local computer.

For now, what I wasn't implementing:

- CloudWatch Groups
- SessionManager for auth to the EC2
- Traffic redirect from private app to public bastion
- More clear README.md (with module attributes and usage)

_But, I plan to fix it ASAP..._