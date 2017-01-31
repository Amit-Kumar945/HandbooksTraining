variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_name" {
  default = "sandy"
}

variable "cidr" {
  default = "172.16.0.0/16"
}

variable "pub_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "mgmt_sn_cidr" {
  default = "172.16.0.0/16"
}
