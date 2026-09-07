#-----------------------------------
# Public Subnets
#-----------------------------------
resource "aws_subnet" "public_a" {
    vpc_id = var.vpc_id
    cidr_block = var.az_a_cidr_public
    availability_zone = var.az_a 
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet-a"
    }
}

resource "aws_subnet" "public_b" {
    vpc_id = var.vpc_id
    cidr_block = var.az_b_cidr_public
    availability_zone = var.az_b 
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet-b"
    }
}

#-----------------------------------
# Private App Subnets
#-----------------------------------
resource "aws_subnet" "private_app_a" {
    vpc_id = var.vpc_id
    cidr_block = var.az_a_cidr_private_app
    availability_zone = var.az_a
    map_public_ip_on_launch = false

    tags = {
        Name = "private-app-subnet-a"
    }
}

resource "aws_subnet" "private_app_b" {
    vpc_id = var.vpc_id
    cidr_block = var.az_b_cidr_private_app
    availability_zone = var.az_b
    map_public_ip_on_launch = false

    tags = {
        Name = "private-app-subnet-b"
    }
}

#-----------------------------------
# Private DB Subnets
#-----------------------------------
resource "aws_subnet" "private_db_a" {
    vpc_id = var.vpc_id
    cidr_block = var.az_a_cidr_private_db
    availability_zone = var.az_a
    map_public_ip_on_launch = false

    tags = {
        Name = "private-db-subnet-a"
    }
}

resource "aws_subnet" "private_db_b" {
    vpc_id = var.vpc_id
    cidr_block = var.az_b_cidr_private_db
    availability_zone = var.az_b
    map_public_ip_on_launch = false
    
    tags = {
        Name = "private-db-subnet-b"
    }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

