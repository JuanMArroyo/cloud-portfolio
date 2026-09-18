resource "aws_instance" "app" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (us-east-1)
  instance_type = "t3.micro"
  subnet_id     = var.private_app_subnet_id
  vpc_security_group_ids = [var.app_sg_id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd

    echo "<h1>Welcome to Project1 — App Tier</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "project1-app-server"
  }
}

resource "aws_lb_target_group_attachment" "app_attachment" {
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.app.id
  port             = 80
}

