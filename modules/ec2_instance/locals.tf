locals {
  name_prefix = "${var.environment}-${var.project_name}"
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
  subnet_count = min(var.public_subnet_count, length(data.aws_availability_zones.available.names))
}
