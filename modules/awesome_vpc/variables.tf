variable "azs" {
  type        = list(any)
  description = "The AZs that the resources will be launched"
}

variable "name" {
  description = "The name of the VPC and etc."
}

variable "environment" {
  description = "The name of the Environment"
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
}

variable "public_subnets" {
  type        = list(any)
  description = "The CIDR block for the public subnet"
}

variable "private_subnets" {
  type        = list(any)
  description = "The CIDR block for the private subnet"
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone."
  type        = bool
  default     = false
}

variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}
