############################################################
#####                     Seoul                         ####
############################################################
#Internet Gateway 라우팅 테이블 

# resource "aws_route" "vpc-perring-seoul-route" {
#     route_table_id = aws_route_table.seoul-rt.id
#     destination_cidr_block = "${var.tokyo-cidr-block["vpc"]}"
#     vpc_peering_connection_id = aws_vpc_peering_connection.seoul.id
# }

############################################################
#####                     Tokyo                         ####
############################################################
# resource "aws_route" "vpc-perring-tokyo-route" {
#     provider = aws.tokyo
#     route_table_id = aws_route_table.tokyo-rt.id
#     destination_cidr_block = "${var.seoul-cidr-block["vpc"]}"
#     vpc_peering_connection_id = aws_vpc_peering_connection.seoul.id
# }
