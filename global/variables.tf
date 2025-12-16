variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-northeast-2"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "192.168.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "192.168.1.0/24"
}

variable "gh_user" {
  description = "GitHub username"
  type        = string
}

variable "gh_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "gh_webhook_secret" {
  description = "GitHub webhook secret"
  type        = string
  sensitive   = true
}

variable "repo_allowlist" {
  description = "Atlantis allowlisted repositories"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Allowed SSH CIDR"
  type        = string
  default     = "0.0.0.0/0"
}
