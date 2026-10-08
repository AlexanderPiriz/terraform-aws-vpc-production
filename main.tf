module "vpc" {
    source = "./modules/vpc"
    environment = "prod"
}

module "subnets" {
    source = "./modules/subnets"
    vpc_id = module.vpc.vpc_id
    environment = "prod"
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id      = module.vpc.vpc_id
  environment = "prod"
}

module "ec2" {
    source = "./modules/ec2"
    
    subnet_id         = module.subnets.public_subnet_ids[0]
    security_group_id = module.security_groups.app_sg
    environment       = "prod"
}

resource "aws_sns_topic" "alerts" {
    name = "prod-alerts"
}

module "cloudwatch_alarms" {
    source        = "./modules/cloudwatch-alarms"
    instance_id   = module.ec2.instance_id
    name_prefix   = "prod-app"
    cpu_threshold = 80
    alarm_actions = [aws_sns_topic.alerts.arn]
}
