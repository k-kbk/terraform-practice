resource "aws_key_pair" "generated" {
  count = var.ssh_public_key != null && var.ssh_key_name == null ? 1 : 0

  key_name   = "${local.name_prefix}-key"
  public_key = var.ssh_public_key

  tags = local.common_tags
}
