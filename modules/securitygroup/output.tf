output "sg-for_basic_server-id" {
  value = "${aws_security_group.for_basic_server.id}"
}

output "sg-for_loadbalancer-id" {
  value = "${aws_security_group.for_loadbalancer.id}"
}