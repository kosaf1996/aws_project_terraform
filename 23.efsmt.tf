############################################################
#####                     Seoul                         ####
############################################################
resource "aws_efs_mount_target" "efs_mount_target_a" {
  file_system_id = aws_efs_file_system.django_app_efs.id
  subnet_id      = aws_subnet.seoul-ecsa.id
}

resource "aws_efs_mount_target" "efs_mount_target_c" {
  file_system_id = aws_efs_file_system.django_app_efs.id
  subnet_id      = aws_subnet.seoul-ecsc.id
}

############################################################
#####                     Tokyo                         ####
############################################################