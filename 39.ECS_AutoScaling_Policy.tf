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
resource "aws_appautoscaling_policy" "seoul-ecs-policy" {
  name               = "scale-down"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.seoul-ecs-target.resource_id
  scalable_dimension = aws_appautoscaling_target.seoul-ecs-target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.seoul-ecs-target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_appautoscaling_policy" "tokyo-ecs-policy" {
  provider           = aws.tokyo
  name               = "scale-down"
  policy_type        = "StepScaling"
  resource_id        = aws_appautoscaling_target.tokyo-ecs-target.resource_id
  scalable_dimension = aws_appautoscaling_target.tokyo-ecs-target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.tokyo-ecs-target.service_namespace

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}
