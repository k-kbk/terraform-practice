resource "aws_security_group" "alb" {
  name        = "${local.name_prefix}-alb-sg"
  description = "Allow HTTP access to ALB"
  vpc_id      = aws_vpc.this.id

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-alb-sg"
  })
}

resource "aws_security_group_rule" "alb_ingress_http" {
  type              = "ingress"
  security_group_id = aws_security_group.alb.id
  description       = "Allow HTTP from the internet"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_egress_http" {
  type              = "egress"
  security_group_id = aws_security_group.alb.id
  description       = "Allow HTTP outbound traffic"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # trivy:ignore:AVD-AWS-0104
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "alb_egress_https" {
  type              = "egress"
  security_group_id = aws_security_group.alb.id
  description       = "Allow HTTPS outbound traffic"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  # trivy:ignore:AVD-AWS-0104
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group" "service" {
  name        = "${local.name_prefix}-service-sg"
  description = "Allow ALB to reach ECS tasks"
  vpc_id      = aws_vpc.this.id

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-service-sg"
  })
}

resource "aws_security_group_rule" "service_ingress_alb" {
  type                     = "ingress"
  security_group_id        = aws_security_group.service.id
  description              = "HTTP from ALB"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "service_egress_http" {
  type              = "egress"
  security_group_id = aws_security_group.service.id
  description       = "Allow HTTP outbound traffic"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  # trivy:ignore:AVD-AWS-0104
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "service_egress_https" {
  type              = "egress"
  security_group_id = aws_security_group.service.id
  description       = "Allow HTTPS outbound traffic"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  # trivy:ignore:AVD-AWS-0104
  cidr_blocks = ["0.0.0.0/0"]
}
