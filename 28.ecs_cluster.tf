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

resource "aws_cloudwatch_log_group" "seoul-ecs" {
  name = "/ecs/django-app-def"
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
resource "aws_cloudwatch_log_group" "tokyo-ecs" {
  provider = aws.tokyo
  name = "/ecs/django-app-def"
}

