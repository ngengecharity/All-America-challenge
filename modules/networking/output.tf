output "vpc" {
  value = module.vpc
}

output "sg_pub_id" {
  value = aws_security_group.allow_ssh_pub.id
}

output "sg_priv_id" {
  value = aws_security_group.allow_ssh_priv.id
}

output "sg_db_access_id" {
  value = aws_security_group.db_access.id
}

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}