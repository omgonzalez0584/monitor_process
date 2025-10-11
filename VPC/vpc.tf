resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.virginia.vpc_cidr[0]
  instance_tenancy = "default"

  tags = {
    Name = var.virginia.name
    name = var.virginia.name
    environment = var.virginia.environment
  }
}