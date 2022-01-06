#!/bin/bash
set -e
sudo yum -y update
sudo yum -y upgrade
sudo amazon-linux-extras install nginx1.12
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
echo "<h2>Hello World!</h2><br>Built by Terraform" > /usr/share/nginx/html/index.html
sudo systemctl enable amazon-ssm-agent nginx
sudo systemctl start amazon-ssm-agent nginx
