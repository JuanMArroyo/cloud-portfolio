resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.project}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_id   # ← this line fixes the error

  tags = {
    Name = "${var.project}-nat-gateway"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "${var.project}-private-rt"
  }
}

resource "aws_route_table_association" "private_assoc" {
  for_each = toset(var.private_subnet_ids)

  subnet_id      = each.value
  route_table_id = aws_route_table.private_rt.id
}

