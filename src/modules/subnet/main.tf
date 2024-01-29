# Define a subnet within the VPC
resource "aws_subnet" "example_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_block #"10.0.1.0/24"
  availability_zone = "us-east-1a"
}