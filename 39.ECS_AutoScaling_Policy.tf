
############################################################
#####                     Seoul                         ####
############################################################
resource "aws_appautoscaling_policy" "seoul-ecs-policy-cpu" {
  name               = "cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.seoul-ecs-target.resource_id
  scalable_dimension = aws_appautoscaling_target.seoul-ecs-target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.seoul-ecs-target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value = var.threshold
  }
  depends_on = [aws_appautoscaling_target.seoul-ecs-target]
}
# resource "aws_appautoscaling_policy" "seoul-ecs-policy-mem" {
#   name               = "mem"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.seoul-ecs-target.resource_id
#   scalable_dimension = aws_appautoscaling_target.seoul-ecs-target.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.seoul-ecs-target.service_namespace

#   target_tracking_scaling_policy_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ECSServiceAverageMemoryUtilization"
#     }
#     target_value = 30

#   }
#   depends_on = [aws_appautoscaling_target.seoul-ecs-target]
# }
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_appautoscaling_policy" "tokyo-ecs-policy" {
  provider           = aws.tokyo
  name               = "cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.tokyo-ecs-target.resource_id
  scalable_dimension = aws_appautoscaling_target.tokyo-ecs-target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.tokyo-ecs-target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value = var.threshold
  }
  depends_on = [aws_appautoscaling_target.tokyo-ecs-target]

}
# resource "aws_appautoscaling_policy" "tokyo-ecs-policy-mem" {
#   provider           = aws.tokyo
#   name               = "mem"
#   policy_type        = "TargetTrackingScaling"
#   resource_id        = aws_appautoscaling_target.tokyo-ecs-target.resource_id
#   scalable_dimension = aws_appautoscaling_target.tokyo-ecs-target.scalable_dimension
#   service_namespace  = aws_appautoscaling_target.tokyo-ecs-target.service_namespace

#   target_tracking_scaling_policy_configuration {
#     predefined_metric_specification {
#       predefined_metric_type = "ECSServiceAverageMemoryUtilization"
#     }
#     target_value = 30

#   }
#   depends_on = [aws_appautoscaling_target.tokyo-ecs-target]

# }

