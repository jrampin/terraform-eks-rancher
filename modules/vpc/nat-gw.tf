resource "aws_eip" "vpc_eip" {
  vpc = true

  tags = {
    Name = format("%s-eip", var.project_name)
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name = format("%s-nat-gateway", var.project_name)
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_route_table" "nat" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = format("%s-private-route", var.project_name)
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_route" "nat_access" {
  route_table_id         = aws_route_table.nat.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}