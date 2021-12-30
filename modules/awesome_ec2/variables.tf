variable "create_ec2" {
  description = "Controls if EC2 should be created (it affects almost all resources)"
  type        = bool
  default     = true
}


variable "name" {
  description = "Name to be used on EC2 instance created"
  type        = string
  default     = ""
}

variable "env_name" {
  description = "Env name for EC2 instance tag"
  type        = string
  default     = "staging"
}

variable "ami" {
  description = "ID of AMI to use for the instance initialization"
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "The type of instance EC2 to start"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = list(any)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with EC2 instance"
  type        = list(string)
  default     = null
}

# variable "key_pair" {
#   description = "SSH Key pair name to ingest into EC2 instance"
#   type        = string
#   default     = "AwesomeProject"
#   sensitive   = true
# }

variable "user_data" {
  description = "Bootstrap script for EC2 instance"
  type        = string
  default     = null
}