resource "aws_cloudwatch_log_group" "nginx" {
  name = "/ec2/nginx/access"
}

