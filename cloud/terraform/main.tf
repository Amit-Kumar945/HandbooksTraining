provider "aws" {
  region = "${var.aws_region}"
}

module "key_pair" {
  source          = "github.com/opstree-terraform/key_pair"
  public_key_path = "${var.pub_key_path}"
  name            = "${var.vpc_name}-key"
}

module "vpc" {
  source            = "github.com/opstree-terraform/vpc"
  cidr              = "${var.vpc_cidr}"
  name              = "${var.vpc_name}"
  route53_zone_name = "${var.route53_zone_name}"
}

module "mgmt_subnet_aza" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "${var.mgmt_subnet_aza_cidr}"
  az                      = "${var.aws_region}a"
  map_public_ip_on_launch = "true"
  name                    = "${var.vpc_name}-mgmt_subnet_aza"
}

module "vpc_pvt_rtb_aza" {
  source    = "github.com/opstree-terraform/pvt_route_table"
  pub_sn_id = "${module.mgmt_subnet_aza.id}"
  vpc_name  = "${var.vpc_name}"
  vpc_id    = "${module.vpc.id}"
}

module "mgmt_subnet_azb" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "${var.mgmt_subnet_azb_cidr}"
  az                      = "${var.aws_region}b"
  map_public_ip_on_launch = "true"
  name                    = "${var.vpc_name}-mgmt_subnet_azb"
}

module "vpc_pvt_rtb_azb" {
  source    = "github.com/opstree-terraform/pvt_route_table"
  pub_sn_id = "${module.mgmt_subnet_azb.id}"
  vpc_name  = "${var.vpc_name}"
  vpc_id    = "${module.vpc.id}"
}

module "app_subnet_aza" {
  source             = "github.com/opstree-terraform/private_subnet"
  vpc_id             = "${module.vpc.id}"
  cidr               = "${var.app_subnet_aza_cidr}"
  az                 = "${var.aws_region}a"
  name               = "${var.vpc_name}-app_subnet_aza"
  pvt_route_table_id = "${module.vpc_pvt_rtb_aza.route_table_id}"
}

module "app_subnet_azb" {
  source             = "github.com/opstree-terraform/private_subnet"
  vpc_id             = "${module.vpc.id}"
  cidr               = "${var.app_subnet_azb_cidr}"
  az                 = "${var.aws_region}b"
  name               = "${var.vpc_name}-app_subnet_azb"
  pvt_route_table_id = "${module.vpc_pvt_rtb_azb.route_table_id}"
}

module "db_subnet_aza" {
  source             = "github.com/opstree-terraform/private_subnet"
  vpc_id             = "${module.vpc.id}"
  cidr               = "${var.db_subnet_aza_cidr}"
  az                 = "${var.aws_region}a"
  name               = "${var.vpc_name}-db_subnet_aza"
  pvt_route_table_id = "${module.vpc_pvt_rtb_aza.route_table_id}"
}

module "db_subnet_azb" {
  source             = "github.com/opstree-terraform/private_subnet"
  vpc_id             = "${module.vpc.id}"
  cidr               = "${var.db_subnet_azb_cidr}"
  az                 = "${var.aws_region}b"
  name               = "${var.vpc_name}-db_subnet_azb"
  pvt_route_table_id = "${module.vpc_pvt_rtb_azb.route_table_id}"
}

module "pub_ssh_sg" {
  source = "github.com/opstree-terraform/pub_ssh_sg"
  vpc_id = "${module.vpc.id}"
}

module "pub_http_sg" {
  source = "github.com/opstree-terraform/pub_web_sg"
  vpc_id = "${module.vpc.id}"
}

data "template_file" "swarm_bootstrap" {
  template = "${file("${path.module}/bootstrap.tpl")}"
}

module "swarm_node_1" {
  source             = "github.com/opstree-terraform/ec2"
  subnet_id          = "${module.mgmt_subnet_aza.id}"
  name               = "spark-node-1"
  key_pair_id        = "${module.key_pair.id}"
  aws_region_os      = "${var.aws_region}-ubuntu"
  security_group_ids = ["${module.vpc.default_sg_id}", "${module.pub_http_sg.id}", "${module.pub_ssh_sg.id}"]
  type               = "t2.micro"
  zone_id            = "${module.vpc.zone_id}"
  aws_region         = "${var.aws_region}"
  user_data          = "${data.template_file.swarm_bootstrap.rendered}"
}
