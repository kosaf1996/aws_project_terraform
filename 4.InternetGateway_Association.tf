############################################################
#####                     Seoul                         ####
############################################################
#Public Zone 대상 선택 
resource "aws_route_table_association" "seoul-rtass" {
  subnet_id      = aws_subnet.seoul-puba.id
  route_table_id = aws_route_table.seoul-rt.id
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_route_table_association" "tokyo-rtass" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo-puba.id
  route_table_id = aws_route_table.tokyo-rt.id
}
