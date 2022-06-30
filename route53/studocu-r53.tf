##############################################################################
#######################      Route 53         ##############################
##############################################################################

resource "aws_route53_record" "devops_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}