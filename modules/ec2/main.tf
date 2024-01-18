
// Create aws_ami filter to pick up the ami available in your region
data "aws_ami" "amazon-linux-2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
  
}

// Configure the jumpbox/bastionhost in a public subnet
resource "aws_instance" "jumpbox" {
  ami                         = data.aws_ami.amazon-linux-2023.id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.vpc.public_subnets[1]
  vpc_security_group_ids      = [var.sg_pub_id]

  tags = {
    "Name" = "${var.namespace}-jumpbox"
  }

  # Copies the ssh key file to home dir
  provisioner "file" {
    source      = "./${var.key_name}.pem"
    destination = "/home/ec2-user/${var.key_name}.pem"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${var.key_name}.pem")
      host        = self.public_ip
    }
  }
  
  //chmod key 400 on EC2 instance
  provisioner "remote-exec" {
    inline = ["chmod 400 ~/${var.key_name}.pem"]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("${var.key_name}.pem")
      host        = self.public_ip
    }

  }

}

// Configure the EC2 instance in a private subnet
resource "aws_instance" "ec2_private" {
  ami                         = data.aws_ami.amazon-linux-2023.id
  associate_public_ip_address = false
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.vpc.private_subnets[1]
  vpc_security_group_ids      = [var.sg_priv_id]
  tags = {
    "Name" = "${var.namespace}-app"
  } 
} 

// Configure web_server EC2 instance
resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon-linux-2023.id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.vpc.private_subnets[0]
  vpc_security_group_ids      = [var.web_sg_id]
  tags = {
    "Name" = "${var.namespace}-web_server"
  }  

}

// Configure web_server EC2 instance
resource "aws_instance" "web_server2" {
  ami                         = data.aws_ami.amazon-linux-2023.id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.vpc.private_subnets[0]
  vpc_security_group_ids      = [var.web_sg_id]
  tags = {
    "Name" = "${var.namespace}-web_server2"
  }  

}