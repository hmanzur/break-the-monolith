/* Security Group for ECS */
resource "aws_security_group" "ecs_service" {
  vpc_id      = var.vpc_id
  name        = "${var.environment}-ecs-service-sg"
  description = "Allow egress from container"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.environment}-ecs-service-sg"
    Environment = var.environment
  }
}


data "aws_ecs_task_definition" "web" {
  task_definition = "${aws_ecs_task_definition.web.family}"
}

resource "aws_ecs_service" "web" {
  name            = "${var.environment}-web"
  task_definition = "${aws_ecs_task_definition.web.family}:${max("${aws_ecs_task_definition.web.revision}", "${data.aws_ecs_task_definition.web.revision}")}"
  desired_count   = 2
  launch_type     = "FARGATE"
  cluster         = aws_ecs_cluster.cluster.id

  network_configuration {
    security_groups = [aws_security_group.ecs_service.id]
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.alb_target_group.arn
    container_name   = "web"
    container_port   = "80"
  }

}
