### create Load Balanvcer ####
resource "aws_lb" "web-lb" {
  name               = "${var.environment}- web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.LB]
  subnets            = [var.public1, var.public2]
  
  tags = {
    Name = "${var.environment} - Web-lb"
  }
}


###defining target group for loadbalancer####

resource "aws_lb_target_group" "backends" {
  name     = "${var.environment} - backend targets"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  target_type = "instance"
}

####create listener for load balancer###

resource "aws_lb_listener" "backends-listner" {
  load_balancer_arn = aws_lb.web-lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backends.arn
  }
}


### attaching instance to load balancer ####

resource "aws_lb_target_group_attachment" "instance1" {
  target_group_arn = aws_lb_target_group.backends.arn
  target_id        = var.App1
  port             = 80
}
resource "aws_lb_target_group_attachment" "instance2" {
  target_group_arn = aws_lb_target_group.backends.arn
  target_id        = var.App2
  port             = 80
}
