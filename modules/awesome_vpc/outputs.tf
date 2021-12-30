output "private_subnets_id" {
  description = "Private subnets ID"
  value       = aws_subnet.private_subnet.*.id
}

output "public_subnets_id" {
  description = "Public subnets ID"
  value       = aws_subnet.public_subnet.*.id
}

output "vpc_cidr_block" {
  description = "Current VPC CIDR block"
  value       = aws_vpc.vpc.cidr_block
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "public_route_table" {
  description = "VPC Route Table"
  value       = aws_route_table.public.id
}

output "private_route_table" {
  description = "VPC Route Table"
  value       = aws_route_table.private.id
}