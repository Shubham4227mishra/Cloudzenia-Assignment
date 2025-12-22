resource "aws_secretsmanager_secret" "rds_secret" {
  name = "wordpress-db-secret"
}

resource "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id = aws_secretsmanager_secret.rds_secret.id

  secret_string = jsonencode({
    username = "admin"
    password = "Hpenvy13"
  })
}

