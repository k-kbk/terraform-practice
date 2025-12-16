output "instance_id" {
  value       = aws_instance.this.id
  description = "ID of the EC2 instance"
}

output "public_ip" {
  value       = aws_instance.this.public_ip
  description = "Public IP (if enabled)"
}

output "security_group_id" {
  value       = aws_security_group.instance.id
  description = "Security group protecting the instance"
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "VPC identifier"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "Public subnets created for the instance"
}

output "key_pair_name" {
  value       = aws_key_pair.this.key_name
  description = "Name of the generated key pair"
}

output "private_key_pem" {
  value       = tls_private_key.this.private_key_pem
  description = "Private key material for the generated key pair"
  sensitive   = true
}
