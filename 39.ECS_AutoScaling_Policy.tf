# resource "aws_ecs_cluster_capacity_providers" "seoul-ecs-cluster-capa" {
#   cluster_name = aws_ecs_cluster.seoul-ecs-cluster.name

#   capacity_providers = ["FARGATE"]

#   default_capacity_provider_strategy {
#     capacity_provider = "FARGATE"
#     base              = 2
#     weight            = 100
#   }
# }

# resource "aws_ecs_cluster_capacity_providers" "tokyo-ecs-cluster-capa" {
#   provider = aws.tokyo
#   cluster_name = aws_ecs_cluster.tokyo-ecs-cluster.name

#   capacity_providers = ["FARGATE"]

#   default_capacity_provider_strategy {
#     capacity_provider = "FARGATE"
#     base              = 2
#     weight            = 100
#   }
# }

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
    target_value = 80
  }
  depends_on = [aws_appautoscaling_target.seoul-ecs-target]
}
resource "aws_appautoscaling_policy" "seoul-ecs-policy-mem" {
  name               = "mem"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.seoul-ecs-target.resource_id
  scalable_dimension = aws_appautoscaling_target.seoul-ecs-target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.seoul-ecs-target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    target_value = 80

  }
  depends_on = [aws_appautoscaling_target.seoul-ecs-target]
}
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
    target_value = 80
  }
  depends_on = [aws_appautoscaling_target.tokyo-ecs-target]

}
resource "aws_appautoscaling_policy" "tokyo-ecs-policy-mem" {
  provider           = aws.tokyo
  name               = "mem"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.tokyo-ecs-target.resource_id
  scalable_dimension = aws_appautoscaling_target.tokyo-ecs-target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.tokyo-ecs-target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    target_value = 80

  }
  depends_on = [aws_appautoscaling_target.tokyo-ecs-target]

}

