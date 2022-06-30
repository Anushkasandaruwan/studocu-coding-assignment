##############################################################################
#######################     ACM         ##############################
##############################################################################

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.0"

  domain_name  = var.domain_name
  zone_id      = data.aws_route53_zone.hosted_zone.zone_id

  subject_alternative_names = [
    var.domain_name
  ]

  wait_for_validation = false

    tags = {
    Name = "studocu"
  }
}



