output "private_key" {
  value     = tls_private_key.asg_key.private_key_pem
  sensitive = true
}