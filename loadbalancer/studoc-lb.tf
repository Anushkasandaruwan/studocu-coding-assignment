##############################################################################
#######################      Application Load balancer         ##############################
##############################################################################

module "alb" {
  source  = "terraform-aws-modules/alb/aws"


  name = var.lb_name

  load_balancer_type = "application"

  vpc_id             = var.vpc.vpc_id
  subnets            = var.vpc.public_subnets
  security_groups    = [var.alb_sg.id]


  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }]
  # ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = var.certificate_arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Name = "studocu"
  }
}