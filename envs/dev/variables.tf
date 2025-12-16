variable "region" {
  description = "AWS region for this environment"
  type        = string
  default     = "ap-northeast-2"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project or workload name"
  type        = string
  default     = "nginx"
}

variable "vpc_cidr" {
  description = "CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 2
}

variable "public_subnet_newbits" {
  description = "New bits for calculating public subnet CIDR blocks"
  type        = number
  default     = 4
}

variable "container_image" {
  description = "Container image to deploy on ECS"
  type        = string
  default     = "nginx:latest"
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 1
}

variable "task_cpu" {
  description = "CPU units to allocate for the ECS task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory (MB) to allocate for the ECS task"
  type        = number
  default     = 512
}

variable "log_retention_days" {
  description = "Retention in days for application CloudWatch Logs"
  type        = number
  default     = 14
}
