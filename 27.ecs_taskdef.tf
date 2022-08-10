############################################################
#####                     Seoul                         ####
############################################################
resource "aws_ecs_task_definition" "seoul-ecs-taskdef" {           #ECS 작업 정의
  family                   = var.ecs-family                        #작업 정의 Name
  requires_compatibilities = ["FARGATE"]                           #FARGATE 유형
  network_mode             = "awsvpc"                              #Docker Network 모드 
  cpu                      = var.ecs-cpu                           #CPU 단위수 
  memory                   = var.ecs-memory                        #메모리 단위수
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn #ECS 컨테이너 에이전트 및 Docker 데몬 작업 실행 역할 ARN 

  container_definitions = jsonencode([ #JSON 컨테이너 정의 목록
    {
      logConfiguration : {     #컨테이너 로그 사양 구성
        logDriver : "awslogs", #컨테이너 로그 드라이버
        options : {
          awslogs-group : "/ecs/django-app-def", #로그 그룹
          awslogs-region : "ap-northeast-2",     #로그 리전
          awslogs-stream-prefix : "ecs"          #Fargate 사용시 로그 스트림을 지정한 접두사
        }
      },
      portMappings : [ #컨테이너 포트 매핑 
        {
          hostPort : "${var.container-hostport}", #컨테이너용 예약 포트 
          protocol : "${var.container-protocol}", #포트 매핑 사용 프로토콜
          containerPort : "${var.container-port}" #호스트 포트에 바인딩된 컨테이너 포트 
        }
      ]
      cpu : "${var.container-cpu}", #컨테이너 예약 포트 
      environment : [],             #컨테이너 전달 환경 변수
      mountPoints : [               #컨테이너 볼륨 탑재 지점
        {
          readOnly : null,                        #true ->  읽기 권한 flase -> 쓰기 권한 
          containerPath : "${var.efs-root-path}", #볼륨을 탑재할 컨테이너 경로 
          sourceVolume : "django-app"             #마운트에 사용할 볼륨 
        }
      ],
      memoryReservation : "${var.container-memory}",                                    # 컨테이너에 예약할 메모리의 소프트 제한 
      volumesFrom : [],                                                                 #컨테이너에서 마운트할 데이터 볼륨 
      image : "${local.account_id}.dkr.ecr.ap-northeast-2.amazonaws.com/django_app:v1", #컨테이너 사용이미지
      name : "app"                                                                      #컨테이너 네임 
      memory : null                                                                     #컨테이너에 표시할 메모리 양 
      compatibilities : [
        "EC2",
        "FARGATE"
      ],
      taskDefinitionArn : "arn:aws:ecs:ap-northeast-2:${local.account_id}:task-definition/django-app-def:1", #작업 정의 ARN
      family : "${var.ecs-family}",
      requiresAttributes : [
        {
          name : "com.amazonaws.ecs.capability.logging-driver.awslogs"
        },
        {
          name : "ecs.capability.execution-role-awslogs"
        },
        {
          name : "ecs.capability.efsAuth"
        },
        {
          name : "com.amazonaws.ecs.capability.ecr-auth"
        },
        {
          name : "com.amazonaws.ecs.capability.docker-remote-api.1.19"
        },
        {
          name : "ecs.capability.efs"
        },
        {
          name : "com.amazonaws.ecs.capability.docker-remote-api.1.21"
        },
        {
          name : "com.amazonaws.ecs.capability.docker-remote-api.1.25"
        },
        {
          name : "ecs.capability.execution-role-ecr-pull"
        },
        {
          name : "com.amazonaws.ecs.capability.docker-remote-api.1.18"
        },
        {
          name : "ecs.capability.task-eni"
        }
      ],
      requiresCompatibilities : [ #작업 정의 유효성 검사 시작 유형 
        "FARGATE"
      ],
      networkMode : "awsvpc",
      status : "ACTIVE",
    }
  ])


  volume { #볼륨 지정
    name = var.django_app
    efs_volume_configuration {                                         #EFS 유형 
      file_system_id     = aws_efs_file_system.seoul-django-app-efs.id #EFS ID
      transit_encryption = "ENABLED"                                   #암호화
      authorization_config {                                           #EFS ACCESS POINT
        access_point_id = aws_efs_access_point.seoul-efs-access-point.id
      }
    }
  }
}

############################################################
#####                     Tokyo                         ####
############################################################

resource "aws_ecs_task_definition" "tokyo-ecs-taskdef" { #ECS 작업 정의
  provider                 = aws.tokyo
  family                   = var.ecs-family                        #작업 정의 Name
  requires_compatibilities = ["FARGATE"]                           #FARGATE 유형
  network_mode             = "awsvpc"                              #Docker Network 모드 
  cpu                      = var.ecs-cpu                           #CPU 단위수 
  memory                   = var.ecs-memory                        #메모리 단위수
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn #ECS 컨테이너 에이전트 및 Docker 데몬 작업 실행 역할 ARN 

  container_definitions = jsonencode([ #JSON 컨테이너 정의 목록
    {
      logConfiguration : {     #컨테이너 로그 사양 구성
        logDriver : "awslogs", #컨테이너 로그 드라이버
        options : {
          awslogs-group : "/ecs/django-app-def", #로그 그룹
          awslogs-region : "ap-northeast-1",     #로그 리전
          awslogs-stream-prefix : "ecs"          #Fargate 사용시 로그 스트림을 지정한 접두사
        }
      },
      portMappings : [ #컨테이너 포트 매핑 
        {
          hostPort : "${var.container-hostport}", #컨테이너용 예약 포트 
          protocol : "${var.container-protocol}", #포트 매핑 사용 프로토콜
          containerPort : "${var.container-port}" #호스트 포트에 바인딩된 컨테이너 포트 
        }
      ]
      cpu : "${var.container-cpu}", #컨테이너 예약 포트 
      environment : [],             #컨테이너 전달 환경 변수
      mountPoints : [               #컨테이너 볼륨 탑재 지점
        {
          readOnly : null,                        #true ->  읽기 권한 flase -> 쓰기 권한 
          containerPath : "${var.efs-root-path}", #볼륨을 탑재할 컨테이너 경로 
          sourceVolume : "django-app"             #마운트에 사용할 볼륨 
        }
      ],
      memoryReservation : "${var.container-memory}",                                    # 컨테이너에 예약할 메모리의 소프트 제한 
      volumesFrom : [],                                                                 #컨테이너에서 마운트할 데이터 볼륨 
      image : "${local.account_id}.dkr.ecr.ap-northeast-1.amazonaws.com/django_app:v1", #컨테이너 사용이미지
      name : "app"                                                                      #컨테이너 네임 
      memory : null                                                                     #컨테이너에 표시할 메모리 양 
      compatibilities : [
        "EC2",
        "FARGATE"
      ],
      taskDefinitionArn : "arn:aws:ecs:ap-northeast-1:${local.account_id}:task-definition/django-app-def:1", #작업 정의 ARN
      family : "${var.ecs-family}",
      requiresAttributes : [
        {
          name : "com.amazonaws.ecs.capability.logging-driver.awslogs"
        },
        {
          name : "ecs.capability.execution-role-awslogs"
        },
        {
          name : "ecs.capability.efsAuth"
        },
        {
          name : "com.amazonaws.ecs.capability.ecr-auth"
        },
        {
          name : "com.amazonaws.ecs.capability.docker-remote-api.1.19"
        },
        {
          name : "ecs.capability.efs"
        },
        {
          name : "com.amazonaws.ecs.capability.docker-remote-api.1.21"
        },
        {
          name : "com.amazonaws.ecs.capability.docker-remote-api.1.25"
        },
        {
          name : "ecs.capability.execution-role-ecr-pull"
        },
        {
          name : "com.amazonaws.ecs.capability.docker-remote-api.1.18"
        },
        {
          name : "ecs.capability.task-eni"
        }
      ],
      requiresCompatibilities : [ #작업 정의 유효성 검사 시작 유형 
        "FARGATE"
      ],
      networkMode : "awsvpc",
      status : "ACTIVE",
    }
  ])


  volume { #볼륨 지정
    name = var.django_app
    efs_volume_configuration {                                                                   #EFS 유형 
      file_system_id     = aws_efs_replication_configuration.tokyo.destination[0].file_system_id #EFS ID
      transit_encryption = "ENABLED"                                                             #암호화
      authorization_config {                                                                     #EFS ACCESS POINT
        access_point_id = aws_efs_access_point.tokyo-efs-access-point.id   
      }
    }
  }
}
