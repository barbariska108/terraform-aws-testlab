terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {                            # Need to change bucket name&key
    bucket = "awesome-terraform-state-bucket"
    key    = "env/staging"
  }
  required_version = ">= 0.15"
}

provider "aws" {
  region = local.region
  default_tags {
    tags = local.common_tags
  }
}