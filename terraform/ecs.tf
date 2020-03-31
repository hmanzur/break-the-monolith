resource "aws_ecs_cluster" "default" {
  name = "${var.environment}-stack"
}

resource "aws_ecr_repository" "microservice" {
  name = "${var.environment}-microservice"
}

resource "aws_autoscaling_group" "scalingWordpress" {
  name               = "${var.environment}-scaling"
  availability_zones = split(",", var.availability_zones)

  launch_configuration = aws_launch_configuration.ecs.name
  min_size             = 1
  max_size             = 10
  desired_capacity     = 1
  vpc_zone_identifier  = [aws_subnet.private-subnet-us-east-1.id]
}

resource "aws_launch_configuration" "ecs" {
  name            = "${var.environment}-launch"
  image_id        = "ami-0b9a214f40c38d5eb"
  instance_type   = "t2.medium"
  security_groups = [aws_security_group.ecs.id]
  user_data       = "#!/bin/bash\necho ECS_CLUSTER=${aws_ecs_cluster.default.name} > /etc/ecs/ecs.config"
}

resource "aws_ecs_task_definition" "registry" {
  family                   = "microservice"
  container_definitions    = file("task-definitions/service.json")
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
}

resource "aws_ecs_service" "backend-service" {
  name            = "BackendService"
  cluster         = aws_ecs_cluster.default.id
  task_definition = aws_ecs_task_definition.registry.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.private-subnet-us-east-1.id, aws_subnet.private2-subnet-us-east-1.id]
    security_groups = [aws_security_group.ecs.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tgDinamarca.id
    container_name   = "microservice"
    container_port   = "80"
  }
}

