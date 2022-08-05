############################################################
#####                     Seoul                         ####
############################################################
resource "aws_instance" "seoul-ec2" {
  ami                         = "${var.seoul-ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key-name}"
  vpc_security_group_ids      = [aws_security_group.seoul-sg.id]
  availability_zone           = "${var.seoul-az["aza"]}"
  subnet_id                   = aws_subnet.seoul-puba.id
  associate_public_ip_address = true
  tags = {
    "Name" = "Bastion"
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_instance" "tokyo-ec2" {
  provider                    = aws.tokyo
  ami                         = "${var.tokyo-ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key-name}"
  vpc_security_group_ids      = [aws_security_group.tokyo-sg.id]
  availability_zone           = "${var.tokyo-az["aza"]}"
  subnet_id                   = aws_subnet.tokyo-puba.id
  associate_public_ip_address = true
  tags = {
    "Name" = "Bastion"
  }
}

