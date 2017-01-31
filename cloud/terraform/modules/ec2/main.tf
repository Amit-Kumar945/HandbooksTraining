data "template_file" "bootstrap" {
  template = "${file("${path.module}/bootstrap.tpl")}"
}

resource "aws_instance" "instance" {
  ami       = "${lookup(var.aws_ami_map, var.aws_region)}"
  count     = "${var.number_of_instances}"
  subnet_id = "${var.subnet_id}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "100"
    delete_on_termination = "true"
  }

  instance_type          = "${var.type}"
  key_name               = "${var.key_pair_id}"
  iam_instance_profile   = "${var.iam_instance_profile}"
  user_data              = "${data.template_file.bootstrap.rendered}"
  vpc_security_group_ids = ["${var.security_group_ids}"]

  tags {
    Name = "${var.name}"
  }
}

resource "aws_route53_record" "route53_record" {
  zone_id = "${var.zone_id}"
  name    = "${var.name}"
  type    = "A"
  ttl     = "30"
  records = ["${aws_instance.instance.private_ip}"]
}

resource "aws_eip" "lb" {
  instance = "${aws_instance.instance.id}"

  # vpc = "${var.vpc}"
}
