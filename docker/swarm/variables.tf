variable "aws_region" {
  default = "us-east-1"
}

variable "pub_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "vpc_name" {
  default = "test"
}

variable "vpc_cidr" {
  default = "18.0.0.0/16"
}

variable "route53_zone_name" {
  default = "test.sandy.com"
}

variable "mgmt_subnet_aza_cidr" {
  default = "18.0.1.0/24"
}

variable "mgmt_subnet_azb_cidr" {
  default = "18.0.2.0/24"
}

variable "app_subnet_aza_cidr" {
  default = "18.0.3.0/24"
}

variable "app_subnet_azb_cidr" {
  default = "18.0.4.0/24"
}

variable "db_subnet_aza_cidr" {
  default = "18.0.5.0/24"
}

variable "db_subnet_azb_cidr" {
  default = "18.0.6.0/24"
}
