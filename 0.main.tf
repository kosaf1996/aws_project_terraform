############################################################
#####                     Seoul                         ####
############################################################
provider "aws" {
  region = "${var.seoul-resion}"
}
provider "aws" {
  alias = "seoul"
  region = "${var.seoul-resion}"
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
  region = "${var.tokyo-resion}"
}

resource "aws_key_pair" "tokyo-gmgu-key" {
    provider = aws.tokyo
    key_name = "${var.key-name}"
    public_key = file("${var.key-path}")
}
