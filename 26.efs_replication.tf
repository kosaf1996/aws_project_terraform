############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_efs_replication_configuration" "tokyo" {
  source_file_system_id = aws_efs_file_system.seoul-django-app-efs.id

  destination {
    region = "${var.tokyo-resion}"
  }
}
