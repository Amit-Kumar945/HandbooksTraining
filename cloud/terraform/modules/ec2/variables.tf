variable "name" {}

variable "type" {
  default = "t2.micro"
}

variable "subnet_id" {}

variable "number_of_instances" {
  default = 1
}

variable "key_pair_id" {
  default = ""
}

variable "security_group_ids" {
  type = "list"
}

variable "zone_id" {}

variable "iam_instance_profile" {
  default = ""
}

variable "aws_region" {}

variable "aws_ami_map" {
  type = "map"

  default = {
    ap-south-1     = "ami-b4c7addb"
    ap-southeast-1 = "ami-f068a193"
  }
}
