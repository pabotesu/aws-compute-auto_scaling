resource "aws_lb" "loadbalancer" {
  load_balancer_type = "application"
  name               = "loadbalancer-for-${var.enviroments}"
  vpc_security_group_ids = ["${var.sg-for_loadbalancer-id}"]
  subnet_id = "${var.public-subnets-ids}"
}

resource "aws_lb_listener" "loadbalancer-http" {
  port              = "80"
  protocol          = "HTTP"

  load_balancer_arn = "${aws_lb.loadbalancer.id}"

  default_action {
    type             = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      message_body = "ok"
    }
  }
}