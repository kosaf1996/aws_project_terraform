############################################################
#####                     Seoul                         ####
############################################################
#배포 기반으로 사용할 CodeDeploy
resource "aws_codedeploy_app" "seoul-codedeploy" {
  compute_platform = "ECS"                                                #컴퓨팅 플랫폼 
  name             = "Seoul-AppECS-django-app-cluster-django-app-service" #애플리케이션 이름
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_codedeploy_app" "tokyo-codedeploy" {
  provider         = aws.tokyo
  compute_platform = "ECS"                                                #컴퓨팅 플랫폼
  name             = "Tokyo-AppECS-django-app-cluster-django-app-service" #애플리케이션 이름
}
