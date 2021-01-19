// Private subnets
resource "aws_subnet" "private_subnet_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet1_network

  availability_zone = format("%sa", var.aws_region)

  tags = {
    Name = format("%s-private-1a", var.project_name)
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet2_network

  availability_zone = format("%sb", var.aws_region)

  tags = {
    Name = format("%s-private-1b", var.project_name)
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.nat.id
}

resource "aws_route_table_association" "private_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.nat.id
}

// Public subnets

resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.main.id

  cidr_block              = var.public_subnet1_network
  map_public_ip_on_launch = true
  availability_zone       = format("%sa", var.aws_region)

  tags = {
    Name = format("%s-public-1a", var.project_name)
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id = aws_vpc.main.id

  cidr_block              = var.public_subnet2_network
  map_public_ip_on_launch = true
  availability_zone       = format("%sb", var.aws_region)

  tags = {
    Name = format("%s-public-1b", var.project_name)
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.igw_route_table.id
}

resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.igw_route_table.id
}
