module "studoc-vpc" {
    source = "./vpc"
}

module "studoc-sg" {
  source = "./security-groups"
  vpc_id = module.studoc-vpc.vpc_id

    depends_on = [
    module.studoc-vpc
  ]
}

module "studoc-alb" {
  source = "./loadbalancer"
  alb_sg = module.studoc-sg.alb_sg
  vpc = module.studoc-vpc.vpc
  certificate_arn = module.studoc-r53.certificate_arn
    depends_on = [
    module.studoc-vpc,module.studoc-sg
  ]
}

module "studoc-asg" {
  source = "./auto-scalling-groups"
  alb_sg = module.studoc-sg.asg_sg
  alb_tg_arn = module.studoc-alb.alb_target_group_arns
  vpc = module.studoc-vpc.vpc
    depends_on = [
    module.studoc-vpc,module.studoc-sg
  ]
}

module "studoc-ec2" {
  vpc = module.studoc-vpc.vpc
  bastion_sg_id= module.studoc-sg.bastion_sg.id
  source = "./ec2"
}

module "studoc-r53" {
  domain_name = var.domain_name
  hosted_zone_name =  var.hosted_zone_name
  alb_dns_name = module.studoc-alb.alb_dns_name
  alb_zone_id = module.studoc-alb.alb_zone_id
  source = "./route53"
}