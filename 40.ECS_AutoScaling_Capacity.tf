############################################################
#####                     Seoul                         ####
############################################################
resource "aws_ecs_cluster_capacity_providers" "seoul-ecs-cluster-capa" {
  cluster_name = aws_ecs_cluster.seoul-ecs-cluster.name

  capacity_providers = ["FARGATE"]
  
  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    base              = var.capacity_base
    weight            = var.capacity_weight
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_ecs_cluster_capacity_providers" "tokyo-ecs-cluster-capa" {
  provider = aws.tokyo
  cluster_name = aws_ecs_cluster.tokyo-ecs-cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    base              = var.capacity_base
    weight            = var.capacity_base
  }
}
