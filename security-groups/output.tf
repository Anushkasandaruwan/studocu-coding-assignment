
output "alb_sg" {
  description = "VPC ID"
  value       = resource.aws_security_group.alb_sg
}
