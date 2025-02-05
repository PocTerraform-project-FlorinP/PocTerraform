resource "aws_lb" "main" {
  name               = "frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets           = [aws_subnet.public.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
}

resource "aws_lb_target_group" "backend" {
  name     = "backend-targetgroup"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}
