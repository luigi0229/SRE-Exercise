module "public_vpc" {
  source = "./modules/vpc"
}

module "myec2" {
  source           = "./modules/ec2"
  public_subnet_id = module.public_vpc.public_subnet_id
  vpc_id           = module.public_vpc.vpc_id
}
