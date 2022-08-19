############################################################
#####                     Seoul                         ####
############################################################
resource "aws_appautoscaling_target" "seoul-ecs-target" {
  max_capacity       = var.max                                                                                            #최대용량
  min_capacity       = var.min                                                                                             #최소용량
  resource_id        = "service/${aws_ecs_cluster.seoul-ecs-cluster.name}/${aws_ecs_service.seoul-ecs-service.name}" #조정 정책과 연결된 리소스
  scalable_dimension = "ecs:service:DesiredCount"                                                                    #API 
  service_namespace  = "ecs"
  #role_arn           = aws_iam_role.ecs-autoscale-role.arn
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_appautoscaling_target" "tokyo-ecs-target" {
  provider           = aws.tokyo
  max_capacity       = var.max                                                                                            #최대용량
  min_capacity       = var.min                                                                                       #최소용량
  resource_id        = "service/${aws_ecs_cluster.tokyo-ecs-cluster.name}/${aws_ecs_service.tokyo-ecs-service.name}" #조정 정책과 연결된 리소스
  scalable_dimension = "ecs:service:DesiredCount"                                                                    #API
  service_namespace  = "ecs"
  #role_arn           = aws_iam_role.ecs-autoscale-role.arn
}
