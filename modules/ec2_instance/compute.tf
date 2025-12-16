resource "aws_instance" "this" {
  ami                         = "ami-0d1ae7d9137336663" # Amazon Linux 2023 kernel-6.1
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.instance.id]
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = var.associate_public_ip
  user_data                   = var.user_data

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = var.root_volume_size
    encrypted   = true

    tags = merge(local.common_tags, {
      Name = "${local.name_prefix}-root"
    })
  }

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-instance"
  })
}
