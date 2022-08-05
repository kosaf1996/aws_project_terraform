############################################################
#####                     Seoul                         ####
############################################################
provider "aws" {
  region = "ap-northeast-2"
}


resource "aws_key_pair" "seoul-gmgu-key" {
    key_name = "${var.key-name}"
    public_key = file("${var.key-path}")
}

############################################################
#####                     Tokyo                         ####
############################################################
provider "aws" {
  alias = "tokyo"
  region = "ap-northeast-1"
}

resource "aws_key_pair" "tokyo-gmgu-key" {
    provider = aws.tokyo
    key_name = "${var.key-name}"
    public_key = file("${var.key-path}")
}
