output "public_ip" {
  value = aws_instance.jumpbox.public_ip
}

output "private_ip" {
 value = aws_instance.ec2_private.private_ip
  // value = aws_instance.ec2_private.*.private_ip
}

output "web_server_ip" {
 value = aws_instance.web_server.private_ip
  // value = aws_instance.ec2_private.*.private_ip
}

output "web_server2_ip" {
 value = aws_instance.web_server2.private_ip
  // value = aws_instance.ec2_private.*.private_ip
}

output "web_server_id" {
 value = aws_instance.web_server.id
}
output "web_server2_id" {
 value = aws_instance.web_server2.id
}