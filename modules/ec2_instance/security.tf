resource "aws_security_group" "instance" {
  name        = "${local.name_prefix}-instance-sg"
  description = "Security group for EC2 instance"
  vpc_id      = aws_vpc.this.id

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-instance-sg"
  })
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  security_group_id = aws_security_group.instance.id
  description       = "Allow SSH"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.ingress_cidrs
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  security_group_id = aws_security_group.instance.id
  description       = "Allow HTTP"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.ingress_cidrs
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  security_group_id = aws_security_group.instance.id
  description       = "Allow all egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
