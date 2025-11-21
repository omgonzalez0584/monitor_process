resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.virginia.vpc_cidr[0]
  instance_tenancy = "default"

  tags = {
    Name = var.virginia.name
    name = var.virginia.name
    environment = var.virginia.environment
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = var.virginia_subnet-public.public_subnet_cidr[0]
  availability_zone = var.availability_zone.availability_zone[0]

  tags = {
    Name        = var.virginia.name
    environment = var.virginia.environment
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc_virginia.id
  cidr_block        = var.virginia_subnet-private.private_subnet_cidr[0]
  availability_zone = var.availability_zone.availability_zone[1]

  tags = {
    Name        = var.virginia.name
    environment = var.virginia.environment
  }
}