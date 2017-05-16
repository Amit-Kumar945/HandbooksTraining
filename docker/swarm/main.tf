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

module "mgmt_subnet_azb" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${module.vpc.id}"
  cidr                    = "${var.mgmt_subnet_azb_cidr}"
  az                      = "${var.aws_region}b"
  map_public_ip_on_launch = "true"
  name                    = "${var.vpc_name}-mgmt_subnet_azb"
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

data "template_file" "nginx_bootstrap" {
  template = "${file("${path.module}/nginxbootstrap.tpl")}"
}

module "swarm_node_1" {
  source             = "github.com/opstree-terraform/ec2"
  subnet_id          = "${module.mgmt_subnet_aza.id}"
  name               = "swarm-node-1"
  key_pair_id        = "${module.key_pair.id}"
  aws_region_os      = "${var.aws_region}-ubuntu"
  security_group_ids = ["${module.vpc.default_sg_id}", "${module.pub_http_sg.id}", "${module.pub_ssh_sg.id}"]
  type               = "t2.micro"
  zone_id            = "${module.vpc.zone_id}"
  aws_region         = "${var.aws_region}"
  user_data          = "${data.template_file.swarm_bootstrap.rendered}"
}

module "swarm_node_2" {
  source             = "github.com/opstree-terraform/ec2"
  subnet_id          = "${module.mgmt_subnet_azb.id}"
  name               = "swarm-node-2"
  key_pair_id        = "${module.key_pair.id}"
  aws_region_os      = "${var.aws_region}-ubuntu"
  security_group_ids = ["${module.vpc.default_sg_id}", "${module.pub_http_sg.id}", "${module.pub_ssh_sg.id}"]
  type               = "t2.micro"
  zone_id            = "${module.vpc.zone_id}"
  aws_region         = "${var.aws_region}"
  user_data          = "${data.template_file.swarm_bootstrap.rendered}"
}

module "swarm_node_3" {
  source             = "github.com/opstree-terraform/ec2"
  subnet_id          = "${module.mgmt_subnet_aza.id}"
  name               = "swarm-node-3"
  key_pair_id        = "${module.key_pair.id}"
  aws_region_os      = "${var.aws_region}-ubuntu"
  security_group_ids = ["${module.vpc.default_sg_id}", "${module.pub_http_sg.id}", "${module.pub_ssh_sg.id}"]
  type               = "t2.micro"
  zone_id            = "${module.vpc.zone_id}"
  aws_region         = "${var.aws_region}"
  user_data          = "${data.template_file.swarm_bootstrap.rendered}"
}

module "haproxy" {
  source             = "github.com/opstree-terraform/ec2"
  subnet_id          = "${module.mgmt_subnet_aza.id}"
  name               = "haproxy"
  key_pair_id        = "${module.key_pair.id}"
  aws_region_os      = "${var.aws_region}-ubuntu"
  security_group_ids = ["${module.vpc.default_sg_id}", "${module.pub_http_sg.id}", "${module.pub_ssh_sg.id}"]
  type               = "t2.micro"
  zone_id            = "${module.vpc.zone_id}"
  aws_region         = "${var.aws_region}"
  user_data          = "${data.template_file.nginx_bootstrap.rendered}"
}
