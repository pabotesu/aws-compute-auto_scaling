##############  for ec2 instance ##############
resource "aws_security_group" "for_basic_server" {
  name        = "${var.enviroments}-for_basic_server-sg"
  description = "${var.enviroments}-for_basic_server-sg"
  vpc_id      = "${var.vpc-id}"

  tags = {
        Name = "${var.enviroments}-instance-sg"
    }
}

resource "aws_security_group_rule" "basic_server-inbound_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  security_group_id = "${aws_security_group.for_basic_server.id}"
}

resource "aws_security_group_rule" "basic_serevr-inbound_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  security_group_id = "${aws_security_group.for_basic_server.id}"
}

resource "aws_security_group_rule" "basic_serevr-inbound_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  security_group_id = "${aws_security_group.for_basic_server.id}"
}

  resource "aws_security_group_rule" "basic_serevr-outbound_allow-all" {
    type = "egress"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.for_basic_server.id}"
  }
############## for ec2 instance ##############

############## for loadbalancer  ##############
  resource "aws_security_group" "for_loadbalancer" {
  name        = "${var.enviroments}-for_loadbalancer-sg"
  description = "${var.enviroments}-for_loadbalancer-sg"
  vpc_id      = "${var.vpc-id}"

  tags = {
        Name = "${var.enviroments}-loadbalancer-sg"
    }
}

resource "aws_security_group_rule" "loadbalancer-inbound_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  security_group_id = "${aws_security_group.for_loadbalancer.id}"
}

resource "aws_security_group_rule" "loadbalancer-inbound_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  security_group_id = "${aws_security_group.for_loadbalancer.id}"
}

resource "aws_security_group_rule" "loadbalancer-outbound_allow-all" {
    type = "egress"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.for_loadbalancer.id}"
  }
############## for loadbalancer  ##############