module "studoc-vpc" {
    source = "./vpc"
 //   environment = var.AWS_ENVIRONMENT_NAME
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
    depends_on = [
    module.studoc-vpc,module.studoc-sg
  ]
}

module "studoc-asg" {
  source = "./auto-scalling-groups"
  alb_sg = module.studoc-sg.alb_sg
  alb_tg_arn = module.studoc-alb.alb_target_group_arns
  vpc = module.studoc-vpc.vpc
    depends_on = [
    module.studoc-vpc,module.studoc-sg
  ]
}