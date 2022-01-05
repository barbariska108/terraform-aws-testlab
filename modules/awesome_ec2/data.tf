data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "default" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}