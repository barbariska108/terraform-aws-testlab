resource "aws_security_group" "bastion_public" {
  name        = "sg_for_public_subnet"
  description = "SG for EC2 instances, which in public subnet"
  vpc_id      = module.awesome_vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  dynamic "ingress" {
    for_each = [local.public_subnets, local.private_subnets]
    content {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ingress.value
    }
  }

  dynamic "egress" {
    for_each = [local.public_subnets, local.private_subnets]
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = egress.value
    }
  }

  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "app_private" {
  name        = "sg_for_private_subnet"
  description = "SG for EC2 instances, which in private subnet"
  vpc_id      = module.awesome_vpc.vpc_id

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = local.public_subnets
    }
  }

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = local.private_subnets
    }
  }
  dynamic "egress" {
    for_each = [local.public_subnets, local.private_subnets]
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = egress.value
    }
  }

  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}