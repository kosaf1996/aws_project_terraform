# Codebuile가 ECR에 접근하기 위한 역할
resource "aws_iam_role" "codebuild-django-app-service-role" {
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
resource "aws_iam_role" "ecs-CodeDeploy-Role" {
  name = "ecs-CodeDeploy-Role"

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
# ECS Task Definition 생성 시 자동으로 생성되는 역할
resource "aws_iam_role" "ecsTaskExecutionRole" {
  name = "ecsTaskExecutionRole"

  assume_role_policy = jsonencode({
    "Version" : "2008-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

/*
resource "aws_iam_role" "ecsTaskRole" {
  name = "ecsTaskRole"

  assume_role_policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
})
}
*/

# Codepipeline Role
resource "aws_iam_role" "codepipeline-role" {
  name = "codepipeline_role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "codepipeline.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}
