provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}

module "ec2_instance" {
  source = "../../modules/ec2_instance"

  environment           = var.environment
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_count   = var.public_subnet_count
  public_subnet_newbits = var.public_subnet_newbits
  instance_type         = var.instance_type
  ami_id                = var.ami_id
  associate_public_ip   = var.associate_public_ip
  ingress_cidrs         = var.ingress_cidrs
  user_data             = var.user_data
  root_volume_size      = var.root_volume_size
}
