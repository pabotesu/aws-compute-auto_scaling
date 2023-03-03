/*-----------------------------vpc settings--------------------------------*/
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc-cidr}"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.enviroments}-vpc"
  }
}
 resource "aws_internet_gateway" "internet-gateway" {
   vpc_id = "${aws_vpc.vpc.id}"
   tags = {
     Name = "${var.enviroments}-igw"
   }
}
/*--------------------------------------end------------------------------------------*/

/*-----------------------------public subnet settings--------------------------------*/
resource "aws_subnet" "public-subnet" {
    vpc_id            = "${aws_vpc.vpc.id}" 
    cidr_block        = "${var.public-subnets}"
    availability_zone = "${var.availability_zone}"
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.enviroments}-public-${var.availability_zone}"
    } 
}

resource "aws_route_table" "public-route-table" {
    vpc_id = "${aws_vpc.vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.internet-gateway.id}"
    }
    tags = {
        Name = "${var.enviroments}-public-route-table"
    } 
}

resource "aws_route_table_association" "public-route-table" {
     subnet_id = "${aws_subnet.public-subnet.id}"
     route_table_id = "${aws_route_table.public-route-table.id}"
     
}
/*--------------------------------------end------------------------------------------*/