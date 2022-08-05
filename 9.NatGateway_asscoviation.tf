############################################################
#####                     Seoul                         ####
############################################################
resource "aws_route_table_association" "seoul-natass-ecsa" {
  subnet_id      = aws_subnet.seoul-ecsa.id
  route_table_id = aws_route_table.seoul-natrt.id
}

resource "aws_route_table_association" "seoul-natass-ecsc" {
  subnet_id      = aws_subnet.seoul-ecsc.id
  route_table_id = aws_route_table.seoul-natrt.id
}

resource "aws_route_table_association" "seoul-natass-dba" {
  subnet_id      = aws_subnet.seoul-dba.id
  route_table_id = aws_route_table.seoul-natrt.id
}

resource "aws_route_table_association" "seoul-natass-dbc" {
  subnet_id      = aws_subnet.seoul-dbc.id
  route_table_id = aws_route_table.seoul-natrt.id
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_route_table_association" "tokyo-db" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo-dba.id
  route_table_id = aws_route_table.tokyo-natrt.id
}

resource "aws_route_table_association" "tokyo-ecsa" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo-ecsa.id
  route_table_id = aws_route_table.tokyo-natrt.id
}

resource "aws_route_table_association" "tokyo-ecsc" {
  provider       = aws.tokyo
  subnet_id      = aws_subnet.tokyo-ecsc.id
  route_table_id = aws_route_table.tokyo-natrt.id
}
