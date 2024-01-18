module "networking" {
  source    = "./modules/networking"
  namespace = var.namespace
}

module "ssh-key" {
  source    = "./modules/ssh-key"
  namespace = var.namespace
}

module "ec2" {
  source          = "./modules/ec2"
  namespace       = var.namespace
  vpc             = module.networking.vpc
  sg_pub_id       = module.networking.sg_pub_id
  sg_priv_id      = module.networking.sg_priv_id
  sg_db_access_id = module.networking.sg_db_access_id
  web_sg_id       = module.networking.web_sg_id
  key_name        = module.ssh-key.key_name
}

module "alb" {
  source            = "./modules/alb"
  namespace         = var.namespace
  alb_sg_id         = module.networking.alb_sg_id
  vpc               = module.networking.vpc
  web_server_id     = module.ec2.web_server_id
  web_server2_id    = module.ec2.web_server2_id
  # Provide other variables as needed
}

module "rds" {
  source            = "./modules/rds"
  namespace         = var.namespace
  allocated_storage = 20
  instance_type     = "db.t2.micro"
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password
  vpc               = module.networking.vpc
  sg_db_access_id   = module.networking.sg_db_access_id

  # Provide other variables as needed
}

