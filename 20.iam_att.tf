resource "aws_iam_role_policy_attachment" "iam_att" {
  role = aws_iam_role.codebuild-django_app-service-role.name
  policy_arn = aws_iam_policy.AccessingECRRepositoryPolicy.arn
}

resource "aws_iam_role_policy_attachment" "test" {
  role = aws_iam_role.ecs_CodeDeploy_Role.name
  policy_arn = aws_iam_policy.CodedeployRoleforECR.arn
}