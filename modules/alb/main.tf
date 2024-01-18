# create application load balancer
resource "aws_lb" "alb" {
  name               = "${var.namespace}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = [
    var.vpc.public_subnets[2],
    var.vpc.private_subnets[0]
  ]
  //vpc_id             = var.vpc.id
  enable_deletion_protection = false

  tags   = {
    Name = "${var.namespace}-alb"
  }
}

# create target group
resource "aws_lb_target_group" "target_group" {
  name        = "${var.namespace}-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc.vpc_id

  health_check {
    enabled             = true
    interval            = 300
    path                = "/"
    timeout             = 60
    matcher             = 200
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "web_server1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.web_server_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web_server2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.web_server2_id
  port             = 80
}

