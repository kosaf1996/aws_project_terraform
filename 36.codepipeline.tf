############################################################
#####                     Seoul                         ####
############################################################
resource "aws_codepipeline" "seoul-codepipeline" {
  # Codepipeline 생성 Step 1: 파이프라인 설정
  name     = "django-pipeline" #파이프 라인 네임
  role_arn = aws_iam_role.codepipeline-role.arn #CodePipeLine Role

  # Codepipeline 생성 Step 1: 고급 설정 - 아티팩트 스토어
  artifact_store {
    location = aws_s3_bucket.seoul-codepipeline-bucket.bucket 
    type     = "S3"
  }

  # Codepipeline 생성 Step 2: 소스 스테이지 추가
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = var.cicd-version
      output_artifacts = ["SourceArtifact"]
      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.github-connection.arn
        FullRepositoryId = "kosaf1996/Django_Instagram"
        BranchName       = "main"
      }
    }
  }

  # Codepipeline 생성 Step 3: 빌드 스테이지 추가
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = var.cicd-version
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      namespace        = "BuildVariables"
      configuration = {
        ProjectName = "django-app"
      }
    }
  }

  # Codepipeline 생성 Step 4: 배포 스테이지 추가
  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeployToECS"
      version         = var.cicd-version
      input_artifacts = ["BuildArtifact", "SourceArtifact"]
      configuration = {
        ApplicationName                = aws_codedeploy_app.seoul-codedeploy.name
        DeploymentGroupName            = "DgpECS-django-app-cluster-django-app-service"
        TaskDefinitionTemplateArtifact = "SourceArtifact"
        TaskDefinitionTemplatePath     = "taskdef.json"
        AppSpecTemplateArtifact        = "SourceArtifact"
        AppSpecTemplatePath            = "appspec.yaml"
        Image1ArtifactName             = "BuildArtifact"
        Image1ContainerName            = "IMAGE1_NAME"

      }
    }
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_codepipeline" "tokyo-codepipeline" {
  # Codepipeline 생성 Step 1: 파이프라인 설정
  provider = aws.tokyo
  name     = "django-pipeline" #파이프 라인 네임
  role_arn = aws_iam_role.codepipeline-role.arn #CodePipeLine Role

  # Codepipeline 생성 Step 1: 고급 설정 - 아티팩트 스토어
  artifact_store {
    location = aws_s3_bucket.tokyo-codepipeline-bucket.bucket 
    type     = "S3"
  }

  # Codepipeline 생성 Step 2: 소스 스테이지 추가
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = var.cicd-version
      output_artifacts = ["SourceArtifact"]
      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.github-connection.arn
        FullRepositoryId = "kosaf1996/Django_Instagram_Tokyo"
        BranchName       = "main"
      }
    }
  }

  # Codepipeline 생성 Step 3: 빌드 스테이지 추가
  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = var.cicd-version
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      namespace        = "BuildVariables"
      configuration = {
        ProjectName = "django-app"
      }
    }
  }

  # Codepipeline 생성 Step 4: 배포 스테이지 추가
  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeployToECS"
      version         = var.cicd-version
      input_artifacts = ["BuildArtifact", "SourceArtifact"]
      configuration = {
        ApplicationName                = aws_codedeploy_app.tokyo-codedeploy.name
        DeploymentGroupName            = "DgpECS-django-app-cluster-django-app-service"
        TaskDefinitionTemplateArtifact = "SourceArtifact"
        TaskDefinitionTemplatePath     = "taskdef.json"
        AppSpecTemplateArtifact        = "SourceArtifact"
        AppSpecTemplatePath            = "appspec.yaml"
        Image1ArtifactName             = "BuildArtifact"
        Image1ContainerName            = "IMAGE1_NAME"

      }
    }
  }
}