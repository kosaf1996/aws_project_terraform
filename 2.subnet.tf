############################################################
#####                     Seoul                         ####
############################################################
#Public Zone 
resource "aws_subnet" "seoul-puba" {
  vpc_id            = aws_vpc.seoul-vpc.id
  cidr_block        =  "${var.seoul-cidr-block["puba"]}"
  availability_zone =  "${var.seoul-az["aza"]}"
  tags = {
    "Name" = "seoul-puba"
  }
}
################################################
resource "aws_subnet" "seoul-pubc" {
  vpc_id            = aws_vpc.seoul-vpc.id
  cidr_block        =  "${var.seoul-cidr-block["pubc"]}"
  availability_zone =  "${var.seoul-az["azc"]}"
  tags = {
    "Name" = "seoul-pubc"
  }
}
################################################
#Private Zone 
resource "aws_subnet" "seoul-ecsa" {
  vpc_id            = aws_vpc.seoul-vpc.id
  cidr_block        = "${var.seoul-cidr-block["ecsa"]}"
  availability_zone = "${var.seoul-az["aza"]}"
  tags = {
    "Name" = "seoul-ecsa"
  }
}
resource "aws_subnet" "seoul-ecsc" {
  vpc_id            = aws_vpc.seoul-vpc.id
  cidr_block        = "${var.seoul-cidr-block["ecsc"]}"
  availability_zone = "${var.seoul-az["azc"]}"
  tags = {
    "Name" = "seoul-ecsc"
  }
}

resource "aws_subnet" "seoul-dba" {
  vpc_id            = aws_vpc.seoul-vpc.id
  cidr_block        = "${var.seoul-cidr-block["dba"]}"
  availability_zone = "${var.seoul-az["aza"]}"
  tags = {
    "Name" = "seoul-dba"
  }
}
resource "aws_subnet" "seoul-dbc" {
  vpc_id            = aws_vpc.seoul-vpc.id
  cidr_block        = "${var.seoul-cidr-block["dbc"]}"
  availability_zone = "${var.seoul-az["azc"]}"
  tags = {
    "Name" = "seoul-dbc"
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
#Public
resource "aws_subnet" "tokyo-puba" {
  provider                = aws.tokyo
  vpc_id                  = aws_vpc.tokyo-vpc.id
  cidr_block              = "${var.tokyo-cidr-block["puba"]}"
  availability_zone       = "${var.tokyo-az["aza"]}"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "tokyo-puba"
  }
}
################################################
resource "aws_subnet" "tokyo-pubc" {
  provider                = aws.tokyo
  vpc_id                  = aws_vpc.tokyo-vpc.id
  cidr_block              = "${var.tokyo-cidr-block["pubc"]}"
  availability_zone       = "${var.tokyo-az["azc"]}"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "tokyo-pubc"
  }
}
################################################
#Private
resource "aws_subnet" "tokyo-ecsa" {
  provider                = aws.tokyo
  vpc_id                  = aws_vpc.tokyo-vpc.id
  cidr_block              = "${var.tokyo-cidr-block["ecsa"]}"
  availability_zone       = "${var.tokyo-az["aza"]}"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "tokyo-ecsa"
  }
}

resource "aws_subnet" "tokyo-ecsc" {
  provider                = aws.tokyo
  vpc_id                  = aws_vpc.tokyo-vpc.id
  cidr_block              = "${var.tokyo-cidr-block["ecsc"]}"
  availability_zone       = "${var.tokyo-az["azc"]}"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "tokyo-ecsc"
  }
}

resource "aws_subnet" "tokyo-dba" {
  provider                = aws.tokyo
  vpc_id                  = aws_vpc.tokyo-vpc.id
  cidr_block              = "${var.tokyo-cidr-block["dba"]}"
  availability_zone       = "${var.tokyo-az["aza"]}"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "tokyo-dba"
  }
}

resource "aws_subnet" "tokyo-dbc" {
  provider                = aws.tokyo
  vpc_id                  = aws_vpc.tokyo-vpc.id
  cidr_block              = "${var.tokyo-cidr-block["dbc"]}"
  availability_zone       = "${var.tokyo-az["azc"]}"
  map_public_ip_on_launch = false
  tags = {
    "Name" = "tokyo-dbc"
  }
}
