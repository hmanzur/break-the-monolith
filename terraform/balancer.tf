resource "aws_lb" "DinamarcaALB" {
  name               = "${var.environment}-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ecsalb.id]
}

resource "aws_lb_listener" "listenerDinamarca" {
  load_balancer_arn = aws_lb.DinamarcaALB.arn
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tgDinamarca.arn
  }
}

resource "aws_lb_target_group" "tgDinamarca" {
  name        = "TGDinamarca"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.LAB.id
  target_type = "ip"
}
