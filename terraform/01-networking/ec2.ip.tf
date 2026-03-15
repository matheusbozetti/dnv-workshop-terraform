resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = var.vpc.nat_gateway_name
  }
}
