############################################################
#####                     Seoul                         ####
############################################################
resource "aws_route_table" "seoul-natrt" {
  vpc_id   = aws_vpc.seoul-vpc.id
  route {
    cidr_block = "${var.all-cidr}"
    gateway_id = aws_nat_gateway.seoul-natgt.id
  }
  tags = {
    "Name" = "seoul-natrt"
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_route_table" "tokyo-natrt" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo-vpc.id
  route {
    cidr_block = "${var.all-cidr}"
    gateway_id = aws_nat_gateway.tokyo-nat.id
  }
  tags = {
    "Name" = "tokyo-natrt"
  }
}
