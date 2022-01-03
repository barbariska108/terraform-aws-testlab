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
