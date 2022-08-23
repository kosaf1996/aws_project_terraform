############################################################
#####                     Seoul                         ####
############################################################
resource "aws_ecs_service" "seoul-ecs-service" {                                    #ECS 서비스 생성
  name                              = "django-app-service"                          #ECS 서비스 Name
  cluster                           = aws_ecs_cluster.seoul-ecs-cluster.id          #클러스터 ID
  task_definition                   = aws_ecs_task_definition.seoul-ecs-taskdef.arn #작업 정의 ARN
  desired_count                     = var.ecs-desired-count                                           #컨테이너 개수 
  launch_type                       = "FARGATE"                                     #시작 유형 
  health_check_grace_period_seconds = var.ecs-health-check                                           #헬스체크 상태 확인 실패 무시 시간

  network_configuration {                                                   #네트워크 구성 
    subnets          = [aws_subnet.seoul-ecsa.id, aws_subnet.seoul-ecsc.id] #서브넷 
    security_groups  = [aws_security_group.seoul-sg.id]                     #보안 그룹
    assign_public_ip = false                                                 #공용 IP 할당 
  }

  load_balancer {                                                    #로드 밸런서
    target_group_arn = aws_lb_target_group.seoul-django-app-blue.arn #ALB ARN
    container_name   = "app"                                         #컨테이너 이름
    container_port   = var.container-hostport                                            #컨테이너 포트 
  }

  deployment_controller { #배포 컨트롤러 구성 
    type = "CODE_DEPLOY"  #CODE_DEPLOY 배포 
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_ecs_service" "tokyo-ecs-service" {                                    #ECS 서비스 생성
  provider = aws.tokyo
  name                              = "django-app-service"                          #ECS 서비스 Name
  cluster                           = aws_ecs_cluster.tokyo-ecs-cluster.id          #클러스터 ID
  task_definition                   = aws_ecs_task_definition.tokyo-ecs-taskdef.arn #작업 정의 ARN
  desired_count                     = var.ecs-desired-count                                          #컨테이너 개수 
  launch_type                       = "FARGATE"                                     #시작 유형 
  health_check_grace_period_seconds = var.ecs-health-check                                           #헬스체크 상태 확인 실패 무시 시간

  network_configuration {                                                   #네트워크 구성 
    subnets          = [aws_subnet.tokyo-ecsa.id, aws_subnet.tokyo-ecsc.id] #서브넷 
    security_groups  = [aws_security_group.tokyo-sg.id]                     #보안 그룹
    assign_public_ip = false                                                 #공용 IP 할당 
  }

  load_balancer {                                                    #로드 밸런서
    target_group_arn = aws_lb_target_group.tokyo-django-app-blue.arn #ALB ARN
    container_name   = "app"                                         #컨테이너 이름
    container_port   = var.container-hostport                                            #컨테이너 포트 
  }

  deployment_controller { #배포 컨트롤러 구성 
    type = "CODE_DEPLOY"  #CODE_DEPLOY 배포 
  }
}
