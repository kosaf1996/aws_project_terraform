############################################################
#####                     Seoul                         ####
############################################################

# 빌드 프로젝트 생성
resource "aws_codebuild_project" "seoul-codebuild" {
  name          = var.django_app #Project_Name
  build_timeout = "5"            #완료로 표시되지 않은 관련 빌드 시간 초과될 떄까지 대기시간

  # Source: Github 경로 설정
  source {
    type            = "GITHUB"                                            #빌드 소스 코드 저장소 유형
    location        = "https://github.com/kosaf1996/Django_Instagram.git" #빌드 소스 코드 경로
    git_clone_depth = 1                                                   #많은 Commit 으로 부터 git history 를  잘라낸다.
  }

  # 환경 설정
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"                           #컴퓨팅 리소스 타입
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0" #빌드 프로젝트에 사용할 이미지
    type                        = "LINUX_CONTAINER"                                #빌드에 사용할 빌드 환경의 유형
    image_pull_credentials_type = "CODEBUILD"                                      #이미지 가져오는 사용하는 자격 증명 
    privileged_mode             = true                                             #Docker 컨테이너 내부 데몬 사용 여부 
  }

  # 서비스 역할
  service_role = aws_iam_role.codebuild-django-app-service-role.arn #CodeBuild IAM 역할 리소스 이름

  # 아티팩트
  artifacts {
    type = "NO_ARTIFACTS" #아티팩트 유형 
  }

  # 캐시 유형
  cache {
    type  = "LOCAL"                      #캐시에 사용할 스토리지 유형
    modes = ["LOCAL_DOCKER_LAYER_CACHE"] #LOCAL인 경우 필수 이며 빌드 종속성 저장하고 재사용 설정 지정 
  }

  # 로그
  logs_config {
    cloudwatch_logs { #cloudwatch 에 로그 저장
      status = "ENABLED"
    }
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
# 빌드 프로젝트 생성
resource "aws_codebuild_project" "tokyo-codebuild" {
  provider = aws.tokyo
  name          = var.django_app #Project_Name
  build_timeout = "5"            #완료로 표시되지 않은 관련 빌드 시간 초과될 떄까지 대기시간

  # Source: Github 경로 설정
  source {
    type            = "GITHUB"                                              #빌드 소스 코드 저장소 유형
    location        = "https://github.com/kosaf1996/Django_Instagram_Tokyo" #빌드 소스 코드 경로
    git_clone_depth = 1                                                     #많은 Commit 으로 부터 git history 를  잘라낸다.
  }

  # 환경 설정
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"                           #컴퓨팅 리소스 타입
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0" #빌드 프로젝트에 사용할 이미지
    type                        = "LINUX_CONTAINER"                                #빌드에 사용할 빌드 환경의 유형
    image_pull_credentials_type = "CODEBUILD"                                      #이미지 가져오는 사용하는 자격 증명 
    privileged_mode             = true                                             #Docker 컨테이너 내부 데몬 사용 여부 
  }

  # 서비스 역할
  service_role = aws_iam_role.codebuild-django-app-service-role.arn #CodeBuild IAM 역할 리소스 이름

  # 아티팩트
  artifacts {
    type = "NO_ARTIFACTS" #아티팩트 유형 
  }

  # 캐시 유형
  cache {
    type  = "LOCAL"                      #캐시에 사용할 스토리지 유형
    modes = ["LOCAL_DOCKER_LAYER_CACHE"] #LOCAL인 경우 필수 이며 빌드 종속성 저장하고 재사용 설정 지정 
  }

  # 로그
  logs_config {
    cloudwatch_logs { #cloudwatch 에 로그 저장
      status = "ENABLED"
    }
  }
}
