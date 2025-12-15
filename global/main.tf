provider "aws" {
  region = var.region
}

resource "aws_security_group" "atlantis_sg" {
  name        = "atlantis-sg"
  description = "Allow Atlantis Webhook and SSH"
  vpc_id      = aws_vpc.mgmt_vpc.id

  tags = {
    Name = "atlantis-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "atlantis_ingress_ssh" {
  type      = "ingress"
  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  # trivy:ignore:AVD-AWS-0107
  cidr_blocks       = [var.allowed_ssh_cidr]
  security_group_id = aws_security_group.atlantis_sg.id
  description       = "Allow SSH from allowed CIDR"
}

resource "aws_security_group_rule" "atlantis_ingress_web" {
  type              = "ingress"
  from_port         = 4141
  to_port           = 4141
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.atlantis_sg.id
  description       = "Allow Atlantis Webhook from GitHub"
}

resource "aws_security_group_rule" "atlantis_egress_http" {
  type      = "egress"
  from_port = 80
  to_port   = 80
  protocol  = "tcp"
  # trivy:ignore:AVD-AWS-0104
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.atlantis_sg.id
  description       = "Allow HTTP outbound traffic"
}

resource "aws_security_group_rule" "atlantis_egress_https" {
  type      = "egress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  # trivy:ignore:AVD-AWS-0104
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.atlantis_sg.id
  description       = "Allow HTTPS outbound traffic"
}

resource "aws_instance" "atlantis_server" {
  ami           = "ami-0d1ae7d9137336663" # Amazon Linux 2023 kernel-6.1
  instance_type = "t4g.small"
  subnet_id     = aws_subnet.mgmt_public_subnet.id

  vpc_security_group_ids = [aws_security_group.atlantis_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.atlantis_profile.name

  root_block_device {
    volume_type = "gp3"
    encrypted   = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  user_data = <<-EOF
    #!/bin/bash

    dnf update -y
    dnf install -y docker
    systemctl enable --now docker
    usermod -aG docker ec2-user

    docker run -d \
      --name atlantis \
      --restart=always \
      -p 4141:4141 \
      -e ATLANTIS_GH_USER="${var.gh_user}" \
      -e ATLANTIS_GH_TOKEN="${var.gh_token}" \
      -e ATLANTIS_GH_WEBHOOK_SECRET="${var.gh_webhook_secret}" \
      -e ATLANTIS_REPO_ALLOWLIST="${var.repo_allowlist}" \
      -e ATLANTIS_PORT=4141 \
      ghcr.io/runatlantis/atlantis:latest server
  EOF

  tags = {
    Name = "atlantis-server"
  }
}

resource "aws_eip" "atlantis_eip" {
  domain = "vpc"

  tags = {
    Name = "atlantis-eip"
  }
}

resource "aws_eip_association" "atlantis_eip_assoc" {
  instance_id   = aws_instance.atlantis_server.id
  allocation_id = aws_eip.atlantis_eip.id
}
