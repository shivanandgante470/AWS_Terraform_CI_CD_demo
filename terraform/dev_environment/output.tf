output "vpc_id" {
  value = module.vpc1.vpc_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "subnet_id" {
  value = module.subnet.subnet_id
}