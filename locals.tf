# Main locals
locals {
  region = "us-west-2"
  common_tags = {
    Owner       = "Boris P."
    Environment = "staging"
    Project     = "Awesome Project"
  }
}

# VPC locals
locals {
  vpc_cidr        = "10.10.10.0/24"
  vpc_name        = "awesome"
  private_subnets = ["10.10.10.32/27"]
  public_subnets  = ["10.10.10.64/27"]
}

locals {
  user_data = <<EOF
      #!/bin/bash
      sudo yum -y update
      sudo amazon-linux-extras install nginx1.12
      echo "<h2>Hello World!</h2><br>Built by Terraform" > /usr/share/nginx/html/index.html
      sudo service nginx start
      sudo -y yum install amazon-cloudwatch-agent awslogs
      sudo systemctl start awslogsd
    EOF
}