variable "cidr_block" {
  type      = string
  default   = ""
}

variable "availability_zones" {
  type      = list(string)
  default   = [""]
}

variable "public_subnet_cidrs" {
  type      = list(string)
  default   = [""]
}

variable "private_subnet_cidrs" {
  type      = list(string)
  default   = [""]
}