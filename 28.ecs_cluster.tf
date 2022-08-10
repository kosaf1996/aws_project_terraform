############################################################
#####                     Seoul                         ####
############################################################
resource "aws_ecs_cluster" "seoul-ecs-cluster" {
  name = "django-app-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_ecs_cluster" "tokyo-ecs-cluster" {
  provider = aws.tokyo
  name     = "django-app-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
