resource "aws_iam_role" "atlantis_role" {
  name = "atlantis-server-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "atlantis_admin_policy" {
  role       = aws_iam_role.atlantis_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "atlantis_profile" {
  name = "atlantis-server-profile"
  role = aws_iam_role.atlantis_role.name
}
