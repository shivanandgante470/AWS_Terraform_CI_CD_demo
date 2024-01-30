# Define a VPC
resource "aws_vpc" "example_vpc" {
  cidr_block            = var.cidr_block  #"10.0.0.0/16"
  instance_tenancy      = "default"
  # availability_zones    = var.availability_zones
  # public_subnet_cidrs   = var.public_subnet_cidrs
  # private_subnet_cidrs  = var.private_subnet_cidrs
  tags = {
    Name        = "cloudy-vpc-useast1-dev"
    Project     = "cloudy"
    Environment = "Dev"
  }
}
