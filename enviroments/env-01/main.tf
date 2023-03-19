provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

module "aws_vpc" {
  source = "../../modules/network"

  #Set Palamater
  enviroments       = "${var.enviroments}"
  vpc-cidr          = "${var.vpc-cidr}"
  availability_zone = "${var.availability_zone}"
  public-subnets    = "${var.public-subnets}"
}

module "aws_sg" {
  source = "../../modules/securitygroup"

  #Set Palamater
  enviroments       = "${var.enviroments}"
  vpc-id            = "${module.aws_vpc.vpc-id}"
}

module "aws_lb" {
  source = "../../modules/loadbalancer"

  #Set Palamater
  enviroments       = "${var.enviroments}"
  vpc-id            = "${module.aws_vpc.vpc-id}"
  public-subnets    = "${var.public-subnets}"
  sg-for_loadbalancer-id  = "${module.aws_sg.sg-for_loadbalancer-id}"
}

module "aws_autoscaling" {
   source = "../../modules/autoscaling"

  #Set Palamater
  enviroments             = "${var.enviroments}"
  vpc-id                  = "${module.aws_vpc.vpc-id}"
  public-subnets-ids      = "${module.aws_vpc.public-subnets-ids}"
  availability_zone       = "${var.availability_zone}"
  sg-for_basic_server-id  = "${module.aws_sg.sg-for_basic_server-id}"
  ec2-config              = "${var.ec2-config}"
}

/*
module "aws_ec2" {
  source = "../../modules/compute"

  #Set Palamater
  enviroments             = "${var.enviroments}"
  vpc-id                  = "${module.aws_vpc.vpc-id}"
  public-subnets-ids      = "${module.aws_vpc.public-subnets-ids}"
  availability_zone       = "${var.availability_zone}"
  sg-for_basic_server-id  = "${module.aws_sg.sg-for_basic_server-id}"
  ec2-config              = "${var.ec2-config}"

}
*/
