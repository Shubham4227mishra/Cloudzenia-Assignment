resource "aws_db_subnet_group" "rds" {
  subnet_ids = aws_subnet.private[*].id
}

resource "aws_db_instance" "wordpress" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "wpadmin"
  password             = jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["password"]
  db_subnet_group_name = aws_db_subnet_group.rds.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  backup_retention_period = 7
  publicly_accessible     = false
  skip_final_snapshot     = true
}

