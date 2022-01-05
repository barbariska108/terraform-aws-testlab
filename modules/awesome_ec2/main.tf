# TO BE FIX:
# Check info reg SSM policy and finalize this one, add IAM policy for CloudWatch!

resource "aws_iam_role" "default" {
  name               = "${var.name}-ssm-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  path               = var.iam_path
  description        = "IAM role for ${var.name}"
}

resource "aws_iam_policy" "default" {
  name        = "${var.name}-ssm-policy"
  policy      = data.aws_iam_policy.default.policy
  path        = var.iam_path
  description = "IAM Policy for using a SSM on ${var.name}"
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

resource "aws_iam_instance_profile" "default" {
  name = "${var.name}-session-manager"
  role = aws_iam_role.default.name
  # path = var.iam_path
}

resource "aws_instance" "default" {
  count = var.create_ec2 && length(var.subnet_id) > 0 ? length(var.subnet_id) : 0

  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  key_name          = var.key_pair
  user_data         = var.user_data

  subnet_id              = element(concat(var.subnet_id, [""]), count.index)
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = aws_iam_instance_profile.default.name

  tags = {
    Name        = "${var.name}-awesome"
    Environment = var.env_name
  }
}