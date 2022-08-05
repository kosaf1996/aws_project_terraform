############################################################
#####                     Seoul                         ####
############################################################
resource "aws_nat_gateway" "seoul-natgt" {
  allocation_id = aws_eip.seoul-natip.id
  subnet_id     = aws_subnet.seoul-puba.id
  tags = {
    "Name" = "seoul-natgt"
  }
  depends_on = [
    aws_internet_gateway.seoul-IG
  ]
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_nat_gateway" "tokyo-nat" {
  provider      = aws.tokyo
  allocation_id = aws_eip.tokyo-natip.id
  subnet_id     = aws_subnet.tokyo-puba.id
  tags = {
    Name = "tokyo-nat"
  }
  depends_on = [
    aws_internet_gateway.tokyo-IG
  ]
}
