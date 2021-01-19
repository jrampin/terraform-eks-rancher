resource "aws_vpc" "main" {
  cidr_block = var.cidr_network

  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  tags = {
    Name = format("%s-vpc", var.project_name)
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}
