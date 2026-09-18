resource "aws_cloudwatch_log_group" "app" {
  name              = "/aws/ec2/app"
  retention_in_days = var.retention_days
}

