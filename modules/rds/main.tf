resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_type
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = [var.sg_db_access_id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  multi_az               = false
  //availability_zone = "us-east-1b"
  //subnet_ids          =  var.vpc.database_subnets[2]

  tags = {
    Environment = "Development"
    Name        = "${var.namespace}-rds"
  }

}

resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "rds_subnet_group"
    subnet_ids = var.vpc.database_subnets

  tags = {
    Name = "${var.namespace}-rds-groupname"
  } 
}  


