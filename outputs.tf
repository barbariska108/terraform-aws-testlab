output "current_aws_ami" {
  description = "Current AMI in use"
  value       = data.aws_ami.latest_amazon_linux.id
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.awesome_vpc.vpc_id
}

output "public_subnets_id" {
  description = "Public Subnets ID"
  value       = module.awesome_vpc.public_subnets_id
}

output "private_subnets_id" {
  description = "Public Subnets ID"
  value       = module.awesome_vpc.private_subnets_id
}

