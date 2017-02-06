resource "aws_eip" "lb" {
 instance = "${aws_instance.id}"
 vpc = "${var.vpc}"

}
