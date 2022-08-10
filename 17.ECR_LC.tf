############################################################
#####                     Seoul                         ####
############################################################
resource "aws_ecr_lifecycle_policy" "seoul-django-app-policy" {
  repository = aws_ecr_repository.seoul-ecr-repo.name

  policy = <<EOF

   {
  "rules": [
    {
      "rulePriority": 1,
      "description": "10개 이상이면 이미지 제거",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_ecr_lifecycle_policy" "tokyo-django-app-policy" {
  provider = aws.tokyo
  repository = aws_ecr_repository.tokyo-ecr-repo.name

  policy = <<EOF

   {
  "rules": [
    {
      "rulePriority": 1,
      "description": "10개 이상이면 이미지 제거",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}