output "atlantis_url" {
  description = "Atlantis Payload URL"
  value       = "http://${aws_eip.atlantis_eip.public_ip}:4141/events"
}

output "atlantis_web_url" {
  description = "Atlantis Web URL"
  value       = "http://${aws_eip.atlantis_eip.public_ip}:4141"
}
