############################################################
#####                     Seoul                         ####
############################################################
resource "aws_efs_file_system" "seoul-django-app-efs" {
  
  tags = {
    "Name" = "${var.django_app}-efs"
  }
}