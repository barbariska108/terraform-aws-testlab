resource "aws_security_group" "bastion_public" {
  name        = "sg_for_public_subnet"
  description = "SG for EC2 instances, which in public subnet"
  vpc_id      = module.awesome_vpc.vpc_id

  dynamic "ingress" {
    for_each = ["80", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "ingress" {
    for_each = ["80", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "TCP"
      cidr_blocks = local.private_subnets
    }
  }

  dynamic "ingress" {
    for_each = ["80", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "TCP"
      cidr_blocks = local.public_subnets
    }
  }
}

resource "aws_security_group" "app_private" {
  name        = "sg_for_private_subnet"
  description = "SG for EC2 instances, which in private subnet"
  vpc_id      = module.awesome_vpc.vpc_id

  dynamic "ingress" { 
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "TCP"
      cidr_blocks = local.public_subnets
    }
  }

  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "TCP"
      cidr_blocks = local.private_subnets
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = local.private_subnets
  }
}