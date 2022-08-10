############################################################
#####                     Seoul                         ####
############################################################
resource "aws_efs_access_point" "seoul-efs-access-point" {
  file_system_id = aws_efs_file_system.seoul-django-app-efs.id
  tags = {
    "Name" = "django-efs-acpoint"
  }
  root_directory {
    path = "${var.efs-root-path}"
    creation_info {
      owner_uid   = "${var.efs-posix}"
      owner_gid   = "${var.efs-posix}"
      permissions = "${var.efs-posix-premissions}"
    }
  }
  posix_user {
    uid            = "${var.efs-posix}"
    gid            = "${var.efs-posix}"
    secondary_gids = ["${var.efs-posix}"]
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_efs_access_point" "tokyo-efs-access-point" {
  provider = aws.tokyo

  file_system_id = aws_efs_replication_configuration.tokyo.destination[0].file_system_id
  tags = {
    "Name" = "django-efs-acpoint"
  }
  root_directory {
    path = "${var.efs-root-path}"
    creation_info {
      owner_uid   = "${var.efs-posix}"
      owner_gid   = "${var.efs-posix}"
      permissions = "${var.efs-posix-premissions}"
    }
  }
  posix_user {
    uid            = "${var.efs-posix}"
    gid            = "${var.efs-posix}"
    secondary_gids = ["${var.efs-posix}"]
  }
}