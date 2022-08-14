############################################################
#####                     Seoul                         ####
############################################################
resource "aws_alb" "seoul-alb" {
  name            = "seoul-alb"
  internal        = false
  #subnets         = [aws_subnet.seoul-ecsa.id, aws_subnet.seoul-ecsc.id]
  subnets         = [aws_subnet.seoul-puba.id, aws_subnet.seoul-pubc.id]
  security_groups = [aws_security_group.seoul-sg.id]
  tags = {
    "Name" = "seoul-alb"
  }
}


############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_alb" "tokyo-alb" {
  provider        = aws.tokyo
  name            = "tokyo-alb"
  internal        = false
  #subnets         = [aws_subnet.tokyo-ecsa.id, aws_subnet.tokyo-ecsc.id]
  subnets         = [aws_subnet.tokyo-puba.id, aws_subnet.tokyo-pubc.id]
  security_groups = [aws_security_group.tokyo-sg.id]
  tags = {
    "Name" = "tokyo-alb"
  }
}

