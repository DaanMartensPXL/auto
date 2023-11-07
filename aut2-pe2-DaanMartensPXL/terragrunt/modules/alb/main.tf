resource "aws_lb_target_group" "target_group" {
  name     = "${var.name}-target-group"
  port     = var.tg_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path      = "/health"
    protocol  = "HTTP"
    matcher   = "200"
  }
}

resource "aws_lb" "alb" {
  name               = "${var.name}-alb"
  load_balancer_type = "application"
  security_groups    = var.lb_sg
  subnets            = var.lb_subnets
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.lb_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}