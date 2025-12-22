resource "aws_ecs_cluster" "main" {
  name = "cloudzenia-cluster"
}

resource "aws_ecs_task_definition" "wordpress" {
  family                   = "wordpress"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 1024
  execution_role_arn       = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name  = "wordpress"
    image = "wordpress:latest"
    portMappings = [{ containerPort = 80 }]

    secrets = [
      {
        name      = "WORDPRESS_DB_PASSWORD"
        valueFrom = aws_secretsmanager_secret.rds_secret.arn
      }
    ]
  }])
}

