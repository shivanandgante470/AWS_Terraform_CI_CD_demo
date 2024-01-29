# Define a security group
resource "aws_security_group" "example_security_group" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
  tags = {
    Name        = "mrt-sg-useast1-dev"
    Project     = "MRT"
    Environment = "Dev"
  }
}
