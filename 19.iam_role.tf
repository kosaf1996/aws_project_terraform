# Codebuile가 ECR에 접근하기 위한 역할
resource "aws_iam_role" "codebuild-django_app-service-role" {
  name = "codebuild-django_app-service-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "codebuild.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = {
    "Name" = "codebuild-django_app-service-role"
  }
}

# Blue/Green 배포용 역할
resource "aws_iam_role" "ecs_CodeDeploy_Role" {
  name = "ecs_CodeDeploy_Role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : ["sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "codedeploy.amazonaws.com"
          ]
        }
      }
    ]
  })

  tags = {
    "Name" = "ecsCodeDeployRole"
  }
}
