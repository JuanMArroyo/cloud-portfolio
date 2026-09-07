resource "aws_vpc" "this" {
    cidr_block         = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = "project1-vpc"
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "project1-igw"
  }
}

