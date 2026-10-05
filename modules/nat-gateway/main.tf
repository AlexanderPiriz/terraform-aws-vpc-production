resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name        = "nat-eip"
    Environment = var.environment
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name        = "nat-gateway"
    Environment = var.environment
  }
}
