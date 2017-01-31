output "id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_route_table_id" {
  value = "${aws_vpc.vpc.main_route_table_id}"
}

output "zone_id" {
  value = "${aws_route53_zone.route53_zone.zone_id}"
}

output "default_sg_id" {
  value = "${aws_vpc.vpc.default_security_group_id}"
}
