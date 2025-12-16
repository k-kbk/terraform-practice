output "instance_id" {
  value       = module.ec2_instance.instance_id
  description = "EC2 instance ID"
}

output "instance_public_ip" {
  value       = module.ec2_instance.public_ip
  description = "Public IP address of the instance"
}

output "security_group_id" {
  value       = module.ec2_instance.security_group_id
  description = "Security group managing ingress"
}

output "key_pair_name" {
  value       = module.ec2_instance.key_pair_name
  description = "Name of the generated key pair"
}

output "key_pair_private_key_pem" {
  value       = module.ec2_instance.private_key_pem
  description = "Private key (PEM) generated for SSH access"
  sensitive   = true
}
