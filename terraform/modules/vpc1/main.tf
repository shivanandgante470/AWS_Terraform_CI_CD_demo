# Define a VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = var.cidr_block  #"10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name        = "mrt-vpc-useast1-dev"
    Project     = "MRT"
    Environment = "Dev"
  }
}
