output "alb_target_group_arns" {
  description = "ALB Traget group arn"
  value       = module.alb.target_group_arns
}

output "alb_dns_name" {
  description = "ALB Traget group arn"
  value       = module.alb.lb_dns_name
}

output "alb_zone_id" {
  description = "ALB Traget group arn"
  value       = module.alb.lb_zone_id
}