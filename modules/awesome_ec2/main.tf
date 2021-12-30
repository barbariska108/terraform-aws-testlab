resource "aws_iam_role" "ssm_role" {
  name = "${var.name}-profile"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ssm.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
data "aws_iam_policy" "ssm" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_role_policy_attachment" "test_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = data.aws_iam_policy.ssm.arn
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "${var.name}-ssm-profile"
  role = aws_iam_role.ssm_role.name
}

resource "aws_instance" "future_ec2" {
  count = var.create_ec2 && length(var.subnet_id) > 0 ? length(var.subnet_id) : 0


  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  # key_name          = var.key_pair
  user_data = var.user_data

  subnet_id              = element(concat(var.subnet_id, [""]), count.index)
  vpc_security_group_ids = var.vpc_security_group_ids
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.id

  tags = {
    Name        = "${var.name}-awesome"
    Environment = var.env_name
  }
}