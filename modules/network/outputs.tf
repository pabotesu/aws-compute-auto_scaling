output "public-subnets-ids" {
  value = "${aws_subnet.public-subnet.id}"
}

output "vpc-id" {
  value = "${aws_vpc.vpc.id}"
}

output "public-route-table-id" {
  value = "${aws_route_table.public-route-table.id}"
}
