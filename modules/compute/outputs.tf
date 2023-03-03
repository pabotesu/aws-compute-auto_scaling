output "ec2-ids" {
  value = ["${aws_instance.ec2.id}"]
}