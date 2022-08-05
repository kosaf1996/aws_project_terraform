# 빌드 프로젝트 생성
resource "aws_codebuild_project" "codebuild" {
  name          = var.django_app
  build_timeout = "5"

  # Source: Github 경로 설정
  source {
    type            = "GITHUB"
    location        = "https://github.com/kosaf1996/Django_Instagram.git"
    git_clone_depth = 1
  }

  # 환경 설정
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode = true
  }

  # 서비스 역할
  service_role  = aws_iam_role.codebuild-django_app-service-role.arn
  
  # 아티팩트
  artifacts {
    type = "NO_ARTIFACTS"
  }

  # 캐시 유형
  cache {
    type = "LOCAL"
    modes = [ "LOCAL_DOCKER_LAYER_CACHE" ]
  }

  # 로그
  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }
  }
}