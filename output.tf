output "private_key" {
  value     = module.studoc-asg.private_key
  sensitive = true
}

output "bastion_key" {
  value     = module.studoc-ec2.private_key
  sensitive = true
}