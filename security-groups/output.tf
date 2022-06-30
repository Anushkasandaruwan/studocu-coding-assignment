
output "alb_sg" {
  description = "ALB Sg"
  value       = resource.aws_security_group.alb_sg
}



output "asg_sg" {
  description = "ALB Sg"
  value       = resource.aws_security_group.asg_sg
}



output "bastion_sg" {
  description = "Bastion Sg"
  value       = resource.aws_security_group.bastion_sg
}