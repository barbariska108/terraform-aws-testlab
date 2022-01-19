variable "azs" {
  type        = list(any)
  description = "The AZs that the resources will be launched"
  default     = null
}

variable "name" {
  type        = string
  description = "The name of the VPC and etc."
  default     = null
}

variable "environment" {
  type        = string
  description = "The name of the Environment"
  default     = null
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block of the VPC"
  default     = null
}

variable "public_subnets" {
  type        = list(any)
  description = "The CIDR block for the public subnet"
  default     = null
}

variable "private_subnets" {
  type        = list(any)
  description = "The CIDR block for the private subnet"
  default     = null
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
