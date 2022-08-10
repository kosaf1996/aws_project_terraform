############################################################
#####                     Seoul                         ####
############################################################
resource "aws_codedeploy_deployment_group" "seoul-codeployGroup" {        #CodeDeploy 배포 그룹
  app_name               = aws_codedeploy_app.seoul-codedeploy.name       #애플리케이션 이름
  deployment_group_name  = "DgpECS-django-app-cluster-django-app-service" #배포그룹 이름
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"               #배포 구성 이름
  service_role_arn       = aws_iam_role.ecs-CodeDeploy-Role.arn           #ecs Service

  # Codedeploy 배포 그룹과 연결
  ecs_service {
    cluster_name = aws_ecs_cluster.seoul-ecs-cluster.name #ECS Cluster Name
    service_name = aws_ecs_service.seoul-ecs-service.name #ECS Service Name 
  }

  deployment_style {
    deployment_type   = "BLUE_GREEN"           #deployment BLUE_GREEN 배포
    deployment_option = "WITH_TRAFFIC_CONTROL" #로드밸런서 배포 트래픽 라우팅 여부 
  }

  blue_green_deployment_config {                #BLUE/GREEN 배포 설정
    deployment_ready_option {                   #새로 프로비저닝된 컨테이너가 수신할 준비가 되었을때 수행할 작업
      action_on_timeout = "CONTINUE_DEPLOYMENT" #새 애플리케이션 개정판을 설치한 직후 로드 밸런서에 새 인스턴스를 등록
    }
    terminate_blue_instances_on_deployment_success { #블루/그린 배포가 성공하면 원래 환경의 인스턴스가 종료되는 방식
      action                           = "TERMINATE" #지정된 대기 시간이 지나면 인스턴스가 종료
      termination_wait_time_in_minutes = 10          #성공적인 블루/그린 배포 후 원래 환경에서 인스턴스를 종료하기 전에 대기할 시간
    }
  }

  load_balancer_info {       #로드밸런서 정보 
    target_group_pair_info { # 배포에 사용할 (애플리케이션/네트워크 로드 밸런서) 대상 그룹
      prod_traffic_route {   #프로덕션 트래픽 경로에 대한 구성
        listener_arns = [aws_lb_listener.seoul-albli-blue.arn]
      }
      test_traffic_route { #테스트 트래픽 경로에 대한 구성
        listener_arns = [aws_lb_listener.seoul-albli-green.arn]
      }
      target_group { #대상 그룹 쌍 내의 대상 그룹에 대한 구성 
        name = aws_lb_target_group.seoul-django-app-blue.name
      }
      target_group { #대상 그룹 쌍 내의 대상 그룹에 대한 구성 
        name = aws_lb_target_group.seoul-django-app-green.name
      }
    }
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_codedeploy_deployment_group" "tokyo-codeployGroup" { #CodeDeploy 배포 그룹
  provider               = aws.tokyo
  app_name               = aws_codedeploy_app.tokyo-codedeploy.name       #애플리케이션 이름
  deployment_group_name  = "DgpECS-django-app-cluster-django-app-service" #배포그룹 이름
  deployment_config_name = "CodeDeployDefault.ECSAllAtOnce"               #배포 구성 이름
  service_role_arn       = aws_iam_role.ecs-CodeDeploy-Role.arn           #ecs Service

  # Codedeploy 배포 그룹과 연결
  ecs_service {
    cluster_name = aws_ecs_cluster.tokyo-ecs-cluster.name #ECS Cluster Name
    service_name = aws_ecs_service.tokyo-ecs-service.name #ECS Service Name 
  }

  deployment_style {
    deployment_type   = "BLUE_GREEN"           #deployment BLUE_GREEN 배포
    deployment_option = "WITH_TRAFFIC_CONTROL" #로드밸런서 배포 트래픽 라우팅 여부 
  }

  blue_green_deployment_config {                #BLUE/GREEN 배포 설정
    deployment_ready_option {                   #새로 프로비저닝된 컨테이너가 수신할 준비가 되었을때 수행할 작업
      action_on_timeout = "CONTINUE_DEPLOYMENT" #새 애플리케이션 개정판을 설치한 직후 로드 밸런서에 새 인스턴스를 등록
    }
    terminate_blue_instances_on_deployment_success { #블루/그린 배포가 성공하면 원래 환경의 인스턴스가 종료되는 방식
      action                           = "TERMINATE" #지정된 대기 시간이 지나면 인스턴스가 종료
      termination_wait_time_in_minutes = 10          #성공적인 블루/그린 배포 후 원래 환경에서 인스턴스를 종료하기 전에 대기할 시간
    }
  }

  load_balancer_info {       #로드밸런서 정보 
    target_group_pair_info { # 배포에 사용할 (애플리케이션/네트워크 로드 밸런서) 대상 그룹
      prod_traffic_route {   #프로덕션 트래픽 경로에 대한 구성
        listener_arns = [aws_lb_listener.tokyo-albli-blue.arn]
      }
      test_traffic_route { #테스트 트래픽 경로에 대한 구성
        listener_arns = [aws_lb_listener.tokyo-albli-green.arn]
      }
      target_group { #대상 그룹 쌍 내의 대상 그룹에 대한 구성 
        name = aws_lb_target_group.tokyo-django-app-blue.name
      }
      target_group { #대상 그룹 쌍 내의 대상 그룹에 대한 구성 
        name = aws_lb_target_group.tokyo-django-app-green.name
      }
    }
  }
}
