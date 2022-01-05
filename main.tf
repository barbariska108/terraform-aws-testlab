module "awesome_vpc" {
  source      = "./modules/awesome_vpc"
  name        = local.vpc_name
  environment = local.common_tags.Environment
  azs         = data.aws_availability_zones.selected.names


  vpc_cidr_block  = local.vpc_cidr
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
}

module "awesome_bastion_ec2" {
  source                 = "./modules/awesome_ec2"
  name                   = "bastion-public"
  ami                    = data.aws_ami.latest_amazon_linux.id
  user_data              = base64encode(local.bastion_user_data)
  subnet_id              = module.awesome_vpc.public_subnets_id
  vpc_security_group_ids = [aws_security_group.bastion_public.id]

  depends_on = [
    module.awesome_vpc
  ]
}

module "awesome_app_ec2" {
  source                 = "./modules/awesome_ec2"
  name                   = "app-private"
  ami                    = data.aws_ami.latest_amazon_linux.id
  user_data              = base64encode(local.app_user_data)
  subnet_id              = module.awesome_vpc.private_subnets_id
  vpc_security_group_ids = [aws_security_group.app_private.id]

  depends_on = [
    module.awesome_vpc
  ]
}

