
variable "cidr_block" {
  type = string
  default = ""
}

variable "subnet_cidr_block" {
 type       = string
 default    = ""
}

variable "vpc_id" {
 type = string
 default = ""
}


variable "instance_type" {
  type = string
  default = null
  description = "The name of the instance type"
}

variable "subnet_id" {
  type = string
  default = null
  description = "The name of the Subnet"
}

variable "security_groups" {
  type = string
  default = null
  description = "The name of the security group"
}

variable "ec2_instance_name" {
  type = string
  default = null
  description = "The name of the ec2 instance"
}
