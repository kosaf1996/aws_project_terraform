############################################################
#####                     Seoul                         ####
############################################################
#Public Zone 대상 선택 
# resource "aws_route_table_association" "seoul-rtass" {
#   subnet_id      = aws_subnet.seoul-ecsa.id
#   route_table_id = aws_route_table.seoul-rt.id
# }
# resource "aws_route_table_association" "seoul-rtass" {
#   subnet_id      = aws_subnet.seoul-ecsc.id
#   route_table_id = aws_route_table.seoul-rt.id
# }
resource "aws_route_table_association" "seoul-rtass" {
  subnet_id      = aws_subnet.seoul-puba.id
  route_table_id = aws_route_table.seoul-rt.id
}
resource "aws_route_table_association" "seoul-rtass1" {
  subnet_id      = aws_subnet.seoul-pubc.id
  route_table_id = aws_route_table.seoul-rt.id
}

############################################################
#####                     Tokyo                         ####
############################################################
# resource "aws_route_table_association" "tokyo-rtass" {
#   provider       = aws.tokyo
#   subnet_id      = aws_subnet.tokyo-ecsa.id
#   route_table_id = aws_route_table.tokyo-rt.id
# }
# resource "aws_route_table_association" "tokyo-rtass" {
#   provider       = aws.tokyo
#   subnet_id      = aws_subnet.tokyo-ecsc.id
#   route_table_id = aws_route_table.tokyo-rt.id
# }
resource "aws_route_table_association" "tokyo-rtass" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo-puba.id
  route_table_id = aws_route_table.tokyo-rt.id
}
resource "aws_route_table_association" "tokyo-rtass1" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo-pubc.id
  route_table_id = aws_route_table.tokyo-rt.id
}