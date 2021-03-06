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


variable "user_data" {
  description = "Bootstrap script for EC2 instance"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "KMS Key ID for CloudWatch"
  type        = string
  default     = null
}

variable "ssm_document_name" {
  description = "The name of the document for SSM"
  type        = string
  default     = "SSM-SessionManagerRunShell"
}
variable "iam_path" {
  description = "Path in which to create the IAM Role and the IAM Policy."
  type        = string
  default     = "/"
}

variable "s3_bucket_name" {
  description = "S3 Bucket Name for CloudWatch"
  type        = string
  default     = "awesome-terraform-state-bucket"
}

variable "s3_key_prefix" {
  description = "S3 Bucket Key Prefix for CloudWatch"
  type        = string
  default     = "cloudwatch"
}