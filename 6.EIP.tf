############################################################
#####                     Seoul                         ####
############################################################
resource "aws_eip" "seoul-natip" {
  vpc      = true
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_eip" "tokyo-natip" {
  provider = aws.tokyo
  vpc      = true
}
