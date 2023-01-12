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

