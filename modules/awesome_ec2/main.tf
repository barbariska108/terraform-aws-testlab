resource "aws_instance" "future_ec2" {
  count = var.create_ec2 && length(var.subnet_id) > 0 ? length(var.subnet_id) : 0


  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  key_name          = var.key_pair
  user_data         = var.user_data

  subnet_id              = element(concat(var.subnet_id, [""]), count.index)
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name        = "${var.name}-awesome"
    Environment = var.env_name
  }
}