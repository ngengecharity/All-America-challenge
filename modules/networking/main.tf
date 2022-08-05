
locals {
  region = "${var.region}"
}  

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name                             = "${var.namespace}-vpc"
  cidr                             = "192.168.0.0/16"
  azs                              = ["${local.region}a", "${local.region}b"]
  private_subnets                  = ["192.168.0.0/24", "192.168.1.0/24"]
  public_subnets                   = ["192.168.2.0/24", "192.168.3.0/24"]
  #assign_generated_ipv6_cidr_block = true
  create_database_subnet_group     = false
  enable_nat_gateway               = true
  single_nat_gateway               = true
}

// SG to allow SSH connections to jumpbox from outside. for security purposes replace 0.0.0.0/0 to a secured IP
resource "aws_security_group" "allow_ssh_pub" {
  name        = "${var.namespace}-jumpbox_ssh"
  description = "Allow SSH inbound traffic to Jumbbox/Bastionhost"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from the internet/outside"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}-jumpbox-ssh"
  }
}

// Security Group to only allow SSH connections from VPC private subnets
resource "aws_security_group" "allow_ssh_priv" {
  name        = "${var.namespace}-allow_ssh_priv"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH only from internal VPC clients"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}-allow_ssh_priv"
  }
}