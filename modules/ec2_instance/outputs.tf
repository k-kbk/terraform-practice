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
