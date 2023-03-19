resource "aws_launch_configuration" "autoscaling-settings" {
  name = "autoscaling-settings"
  ami = "${lookup(var.ec2-config, "image")}"
  instance_type = "${lookup(var.ec2-config, "machine_type")}"
  key_name = "${lookup(var.ec2-config, "access_keypair")}"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["${var.sg-for_basic_server-id}"]
  subnet_id = "${var.public-subnets-ids}"
  root_block_device {
      volume_type = "${lookup(var.ec2-config, "block_device_type")}"
      volume_size = "${lookup(var.ec2-config, "block_device_size")}"
  }
  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "dev_api" {
    availability_zone = "${var.availability_zone}"
    name = "dev-api"
    max_size = 4
    min_size = 1
    desired_capacity = 1
    health_check_grace_period = 300
    health_check_type = "ELB"
    force_delete = true
    launch_configuration = "${aws_launch_configuration.autoscaling-settings.id}"
    vpc_zone_identifier = ["${var.public-subnets-ids}"]
    load_balancers = ["${var.loadbalancer-id}"]
    tags = {
       Name = "basic_server-autoscaling-${var.enviroments}"
    }
    lifecycle {
        create_before_destroy = true
    }
}