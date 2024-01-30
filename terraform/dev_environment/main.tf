terraform {
  # Run init/plan/apply with "backend" commented-out (ueses local backend) to provision Resources (Bucket, Table)
  # Then uncomment "backend" and run init, apply after Resources have been created (uses AWS)
  backend "s3" {
    bucket         = "dev-tf-state-backend"
    key            = "tf-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# module "tf-state" {
#   source      = "./modules/tf-state"
#   bucket_name = "dev-tf-state-backend"
# }

/*
module "vpc-infra" {
  source = "./modules/vpc"
  # VPC Input Vars
  vpc_cidr             = local.vpc_cidr
  availability_zones   = local.availability_zones
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
}
*/

module "vpc1" {
  source      = "../../terraform/modules/vpc1"
  cidr_block           = local.vpc_cidr
  availability_zones   = local.availability_zones
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
}

module "subnet" {
  source            = "../../terraform/modules/subnet"
  vpc_id            = module.vpc1.vpc_id
  subnet_cidr_block = var.subnet_cidr_block
  depends_on        = [ module.vpc1 ]
}

module "security_group" {
  source            = "../../terraform/modules/security_group"
  vpc_id            = module.vpc1.vpc_id
  depends_on        = [ module.subnet, module.vpc1 ]

}

module "ec2_instance" {
  source            = "../../terraform/modules/ec2_instance"
  instance_type     = var.instance_type
  ec2_instance_name = var.ec2_instance_name
  subnet_id         = module.subnet.subnet_id
  security_groups   = module.security_group.security_group_id
  depends_on        = [ module.security_group ]
}