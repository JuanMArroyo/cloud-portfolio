module "vpc" {
    source  = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
}

module "subnets" {
  source                   = "./modules/subnets"
  vpc_id                   = module.vpc.vpc_id
  igw_id                   = module.vpc.igw_id
  az_a                     = "us-east-1a"
  az_b                     = "us-east-1b"
  az_a_cidr_public         = "10.0.1.0/24"
  az_b_cidr_public         = "10.0.2.0/24"
  az_a_cidr_private_app    = "10.0.3.0/24"
  az_b_cidr_private_app    = "10.0.4.0/24"
  az_a_cidr_private_db     = "10.0.5.0/24"
  az_b_cidr_private_db     = "10.0.6.0/24"
}

module "security" {
  source           = "./modules/security"
  vpc_id           = module.vpc.vpc_id
  alb_ingress_cidr = "0.0.0.0/0"
}

module "s3_logs" {
  source = "./modules/s3_logs"
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.subnets.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  log_bucket_name   = module.s3_logs.bucket_name
}

module "ec2" {
  source                = "./modules/ec2"
  app_sg_id             = module.security.app_sg_id
  private_app_subnet_id = module.subnets.private_app_a_id
  target_group_arn      = module.alb.target_group_arn
}

module "rds" {
    source = "./modules/rds"
    db_subnet_ids = module.subnets.private_db_subnet_ids
    db_sg_id = module.security.db_sg_id
    db_username = var.db_username
    db_password = var.db_password
}
