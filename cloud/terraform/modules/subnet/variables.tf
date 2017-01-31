variable "vpc_id" {}

variable "cidr" {}

variable "az" {}

variable "name" {
  default = "private-sn"
}

variable "map_public_ip_on_launch" {
  default = "false"
}
