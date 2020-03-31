resource "aws_vpc" "LAB" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${var.environment}-vpc"
  }
}

