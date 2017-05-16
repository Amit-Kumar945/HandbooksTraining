output "swarm_node_1_ip" {
  value = "${module.swarm_node_1.public_ip}"
}

output "swarm_node_2_ip" {
  value = "${module.swarm_node_2.public_ip}"
}

output "swarm_node_3_ip" {
  value = "${module.swarm_node_3.public_ip}"
}

output "hproxy_ip" {
  value = "${module.haproxy.public_ip}"
}
