terraform {
  backend "s3" {}
}

module "vpc" {
  source      = "../../modules/vpc"
  environment = var.environment
}

module "subnets" {
  source      = "../../modules/subnets"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

module "nat_gateway" {
  source            = "../../modules/nat-gateway"
  public_subnet_id  = module.subnets.public_subnet_ids[0]
  environment       = var.environment
}

module "security_groups" {
  source      = "../../modules/security-groups"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}

module "ec2" {
  source            = "../../modules/ec2"
  subnet_id         = module.subnets.private_subnet_ids[0]
  security_group_id = module.security_groups.app_sg_id
  environment       = var.environment
}
