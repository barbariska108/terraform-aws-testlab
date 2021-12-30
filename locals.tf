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