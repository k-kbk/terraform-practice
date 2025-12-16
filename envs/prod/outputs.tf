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
