# ###########################################################
# ####                     Seoul                         ####
# ###########################################################
# resource "aws_vpc_peering_connection" "seoul" {
#   vpc_id        = aws_vpc.seoul-vpc.id
#   peer_vpc_id   = aws_vpc.tokyo-vpc.id
#   peer_owner_id = "${local.account_id}"
#   peer_region   = "${var.tokyo-resion}"
#   auto_accept   = false

#   tags = {
#     Name = "seoul-tokyo"
#     Side = "Requester"
#   }
# }

# ###########################################################
# ####                     Tokyo                         ####
# ###########################################################
# resource "aws_vpc_peering_connection_accepter" "tokyo" {
#   provider                  = aws.tokyo
#   vpc_peering_connection_id = aws_vpc_peering_connection.seoul.id
#   auto_accept               = true

#   tags = {
#     Name = "seoul-tokyo"
#     Side = "Accepter"
#   }
# }

