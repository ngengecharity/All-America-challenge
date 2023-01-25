output "public_ip" {
  value = aws_instance.jumpbox.public_ip
}

output "private_ip" {
 value = aws_instance.ec2_private.private_ip
  // value = aws_instance.ec2_private.*.private_ip
}

output "web_server_public_ip" {
 value = aws_instance.web_server.public_ip
  // value = aws_instance.ec2_private.*.private_ip
}

output "web_server2_public_ip" {
 value = aws_instance.web_server2.public_ip
  // value = aws_instance.ec2_private.*.private_ip
}

output "db_server_private_ip" {
 value = aws_instance.db_server.private_ip
  // value = aws_instance.ec2_private.*.private_ip
}