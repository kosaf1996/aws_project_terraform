############################################################
#####                     Seoul                         ####
############################################################
resource "aws_vpc" "seoul-vpc" {
  cidr_block           = var.seoul-cidr-block["vpc"]
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "seoul-vpc"
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_vpc" "tokyo-vpc" {
  provider = aws.tokyo
  cidr_block           = "${var.tokyo-cidr-block["vpc"]}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "tokyo-vpc"
  }
}
