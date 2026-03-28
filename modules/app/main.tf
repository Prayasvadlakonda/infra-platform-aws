resource "aws_ecs_cluster" "main" {
  name = "platform-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "platform-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "ghcr.io/prayasvadlakonda/platform-cicd-system:latest"
      essential = true
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
        }
      ]
    }
  ])
}