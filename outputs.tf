output "current_aws_ami" {
  description = "Current AMI in use"
  value       = data.aws_ami.latest_amazon_linux.id
}