resource "aws_subnet" "public" {
  count                   = 2
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet("10.0.0.0/16", 4, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-${count.index}"
    Environment = var.environment
  }
}

resource "aws_subnet" "private" {
  count      = 2
  vpc_id     = var.vpc_id
  cidr_block = cidrsubnet("10.0.0.0/16", 4, count.index + 10)

  tags = {
    Name        = "private-${count.index}"
    Environment = var.environment
  }
}
