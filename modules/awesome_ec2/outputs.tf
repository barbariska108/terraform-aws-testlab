output "ec2_instance_ids" {
  description = "New EC2 instances IDs"
  value       = aws_instance.default.*.id
}

output "iam_role_id" {
  description = "Created IAM roles for the SSM"
  value       = aws_iam_role.default.*.id
}