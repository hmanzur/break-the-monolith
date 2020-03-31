resource "aws_subnet" "private-subnet-us-east-1" {
  vpc_id            = aws_vpc.LAB.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private2-subnet-us-east-1" {
  vpc_id            = aws_vpc.LAB.id
  cidr_block        = var.private2_subnet_cidr
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "public-subnet-us-east-1" {
  vpc_id            = aws_vpc.LAB.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "public2-subnet-us-east-1" {
  vpc_id            = aws_vpc.LAB.id
  cidr_block        = var.public2_subnet_cidr
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "ops-subnet-us-east-1" {
  vpc_id            = aws_vpc.LAB.id
  cidr_block        = var.ops_subnet_cidr
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "ops2-subnet-us-east-1" {
  vpc_id            = aws_vpc.LAB.id
  cidr_block        = var.ops2_subnet_cidr
  availability_zone = "us-east-1b"
}

