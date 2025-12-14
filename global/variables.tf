variable "region" {
  description = "AWS region"
  default     = "ap-northeast-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "192.168.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  default     = "192.168.1.0/24"
}

variable "gh_user" {
  description = "GitHub Username"
  type        = string
}

variable "gh_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "gh_webhook_secret" {
  description = "GitHub Webhook Secret"
  type        = string
  sensitive   = true
}

variable "repo_allowlist" {
  description = "Atlantis Allowlisted Repositories"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Allowed SSH CIDR"
  default     = "0.0.0.0/0"
}
