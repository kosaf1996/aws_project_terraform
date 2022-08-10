############################################################
#####                     Seoul                         ####
############################################################
resource "aws_efs_mount_target" "seoul-efs-mount-target-a" {
  file_system_id = aws_efs_file_system.seoul-django-app-efs.id
  security_groups = [aws_security_group.seoul-sg.id]
  subnet_id      = aws_subnet.seoul-ecsa.id
}

resource "aws_efs_mount_target" "seoul-efs-mount-target-c" {
  file_system_id = aws_efs_file_system.seoul-django-app-efs.id
  security_groups = [aws_security_group.seoul-sg.id]
  subnet_id      = aws_subnet.seoul-ecsc.id
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_efs_mount_target" "tokyo-efs-mount-target-a" {
  provider = aws.tokyo
  file_system_id = aws_efs_replication_configuration.tokyo.destination[0].file_system_id
  security_groups = [aws_security_group.tokyo-sg.id]
  subnet_id      = aws_subnet.tokyo-ecsa.id
}

resource "aws_efs_mount_target" "tokyo-efs-mount-target-c" {
  provider = aws.tokyo
  file_system_id = aws_efs_replication_configuration.tokyo.destination[0].file_system_id
  security_groups = [aws_security_group.tokyo-sg.id]
  subnet_id      = aws_subnet.tokyo-ecsc.id
}
