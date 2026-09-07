#-----------------------------------
# ALB Security Group
#-----------------------------------
resource "aws_security_group" "alb_sg" {
    name = "alb-sg"
    description = "Allow HTTP traffic from the internet"
    vpc_id = var.vpc_id

    ingress {
        description = "Allow HTTP from anywhere"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.alb_ingress_cidr]
    }

    egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "alb-sg"
    }
}

#-----------------------------------
# App Security Group
#-----------------------------------
resource "aws_security_group" "app_sg" {
    name = "app-sg"
    description = "Allow traffic from ALB only"
    vpc_id = var.vpc_id

    ingress {
        description = "Allow HTTP from ALB"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        security_groups = [aws_security_group.alb_sg.id]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port = 0 
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "app-sg"
    }
}

#-----------------------------------
# DB Security Group
#-----------------------------------
resource "aws_security_group" "db_sg" {
    name = "db-sg"
    description = "Allow MySQL traffic from App tier only"
    vpc_id = var.vpc_id
    
    ingress {
        description = "MySQL from App servers"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.app_sg.id]
    }

    egress {
        description = "Allow outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "db-sg"
    }
}
