resource "aws_instance" "ec2" {
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
    #user_data = "${file("${lookup(var.ec2-config, "user-file")}")}"

    tags = {
       Name = "basic_server-${var.enviroments}"
    }
}
