provider "aws" {
  region = "${var.aws_region}"
}

module "vpc" {
  source = "./modules/vpc"
  cidr   = "${var.cidr}"
  name   = "${var.vpc_name}"
}

module "key_pair" {
  source          = "./modules/key_pair"
  public_key_path = "${var.pub_key_path}"
  name            = "${var.vpc_name}-keypair"
}

module "mgmt_subnet" {
  source                  = "./modules/subnet"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "${var.mgmt_sn_cidr}"
  az                      = "${var.aws_region}a"
  map_public_ip_on_launch = "true"
}

module "docker-node0" {
  source             = "./modules/ec2"
  subnet_id          = "${module.mgmt_subnet.id}"
  aws_region         = "${var.aws_region}"
  name               = "${var.vpc_name}-docker-node0"
  type               = "t2.micro"
  key_pair_id        = "${module.key_pair.id}"
  zone_id            = "${module.vpc.zone_id}"
  security_group_ids = ["${module.vpc.default_sg_id}"]
}
