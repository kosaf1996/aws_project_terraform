############################################################
#####                     Seoul                         ####
############################################################
resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = aws_efs_file_system.django_app_efs.id
  tags = {
    "Name" = "django-efs-acpoint"
  }
  root_directory {
    path = "/django/Django_Instagram/media"
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
