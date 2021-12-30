Create the next infrastructure in AWS using Terraform:

Non-default VPC with:
  -  1 public subnet
  -  1 private subnet
  -  1 Internet gateway
  -  1 NAT gateway

2 EC2 instances (free tier) (AMI: Amazon Linux 2 latest):
  -  1 instance in the private subnet (install Nginx) - should be non-accessible from the Internet
  -  1 instance(Bastion) in public subnet should be allowed only ssh access from the Internet
  -  2 instances should have Internet access
  -  You should have a possibility to reach Webpage of Nginx on your local machine from private EC2 instances through Bastion
Create 2 Cloudwatch log groups and logging data from /var/log/secure of each EC2 to related Cloudwatch log group
Create and use your own Terraform modules in your code.
Use S3 Bucket for keeping terraform state there.
  -   Enable S3 Versioning for it.
Use Session Manager access to Bastion instead of PEM Keys.
Create README.md – with Prerequisites, Description which describe each module, and how to run on the local computer.
