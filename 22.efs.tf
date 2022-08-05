resource "aws_efs_file_system" "django_app_efs" {
  encrypted = true
  tags = {
    "Name" = "${var.django_app}-efs"
  }
}