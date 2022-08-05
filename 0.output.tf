############################################################
#####                     Seoul                         ####
############################################################
output "seoul-dns-name" {
  description = "Seoul ALB DNS Address"
  value = aws_alb.seoul-alb.dns_name
}
output "seoul-bastion" {
  description = "Seoul Bastion Host IP "
  value = aws_instance.seoul-ec2.public_ip
}


############################################################
#####                     Tokyo                         ####
############################################################
output "tokyo-dns-name" {
  description = "Tokyo ALB DNS Address"
  value = aws_alb.tokyo-alb.dns_name
}
output "tokyo-bastion" {
  description = "Tokyo Bastion Host IP "
  value = aws_instance.tokyo-ec2.public_ip
}
