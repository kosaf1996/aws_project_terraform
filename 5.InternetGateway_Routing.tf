############################################################
#####                     Seoul                         ####
############################################################
#Internet Gateway 라우팅 테이블 
resource "aws_route_table" "seoul-rt" {
  vpc_id   = aws_vpc.seoul-vpc.id
  route {
    cidr_block = "${var.all-cidr}"
    gateway_id = aws_internet_gateway.seoul-IG.id
  }
  tags = {
    "Name" = "seoul-rt"
  }
}
############################################################
#####                     Tokyo                         ####
############################################################

resource "aws_route_table" "tokyo-rt" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo-vpc.id
  route {
    cidr_block = "${var.all-cidr}"
    gateway_id = aws_internet_gateway.tokyo-IG.id
  }
  tags = {
    "Name" = "tokyo-rt"
  }
}
