############################################################
#####                     Seoul                         ####
############################################################
resource "aws_internet_gateway" "seoul-IG" {
  vpc_id   = aws_vpc.seoul-vpc.id
  tags = {
    "Name" = "seoul-IG"
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_internet_gateway" "tokyo-IG" {
  provider = aws.tokyo
  vpc_id   = aws_vpc.tokyo-vpc.id
  tags = {
    Name = "tokyo-IG"
  }
}
