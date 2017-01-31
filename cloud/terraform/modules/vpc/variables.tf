variable "name" {
  default     = "adtech-vpc"
  description = "Name tag for the VPC to be created"
}

variable "cidr" {}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "enable_dns_support" {
  default = "true"
}

variable "route53_zone_name" {
  default = "internal.adtech.com"
}
