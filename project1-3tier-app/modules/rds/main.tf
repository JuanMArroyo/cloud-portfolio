resource "aws_db_subnet_group" "db_subnets" {
  name       = "project1-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "project1-db-subnet-group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = "project1-db"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp3"

  username                = var.db_username
  password                = var.db_password

  db_subnet_group_name    = aws_db_subnet_group.db_subnets.name
  vpc_security_group_ids  = [var.db_sg_id]

  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false

  tags = {
    Name = "project1-db"
  }
}

