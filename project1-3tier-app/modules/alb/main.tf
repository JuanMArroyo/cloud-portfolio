resource "aws_lb" "this" {
  name = "project1-alb"
  load_balancer_type = "application"
  security_groups = [var.alb_sg_id]
  subnets = var.public_subnet_ids

  enable_deletion_protection = false

  access_logs {
    bucket = var.log_bucket_name
    enabled = true
  }

  tags = {
    Name = "project1-alb"
  }
}

resource "aws_lb_target_group" "app_tg" {
  name = "project1-app-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path = "/"
    protocol = "HTTP"
    interval = 15
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "project1-app-tg"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.this.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
