resource "aws_vpc" "mgmt_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "management-vpc"
  }
}

resource "aws_internet_gateway" "mgmt_igw" {
  vpc_id = aws_vpc.mgmt_vpc.id

  tags = {
    Name = "management-igw"
  }
}

resource "aws_subnet" "mgmt_public_subnet" {
  vpc_id                  = aws_vpc.mgmt_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = "${var.region}a"

  tags = {
    Name = "management-public-subnet"
  }
}

resource "aws_route_table" "mgmt_public_rt" {
  vpc_id = aws_vpc.mgmt_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mgmt_igw.id
  }

  tags = {
    Name = "management-public-rt"
  }
}

resource "aws_route_table_association" "mgmt_public_rta" {
  subnet_id      = aws_subnet.mgmt_public_subnet.id
  route_table_id = aws_route_table.mgmt_public_rt.id
}
