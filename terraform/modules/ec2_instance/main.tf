# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux2" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

# Define an EC2 instance
resource "aws_instance" "ec2_instance" {
  ami             = data.aws_ami.amzlinux2.id #"ami-0c55b159cbfafe1f0"  # Example AMI ID (Amazon Linux 2)
  instance_type   = var.instance_type #"t2.micro"
  subnet_id       = var.subnet_id
  security_groups = [var.security_groups]

  tags = {
    Name = var.ec2_instance_name #"dev-us-east-ec2"
  }
}