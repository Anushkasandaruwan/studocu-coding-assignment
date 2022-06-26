output "vpc_name" {
  description = "VPC name"
  value       = module.vpc.name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}


output "vpc_private_subnets" {
  description = "VPC ID"
  value       = module.vpc.private_subnets
}


output "vpc" {
  description = "VPC ID"
  value       = module.vpc
}
