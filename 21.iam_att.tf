resource "aws_iam_role_policy_attachment" "iam-att" {
  role = aws_iam_role.codebuild-django-app-service-role.name
  policy_arn = aws_iam_policy.Seoul-AccessingECRRepositoryPolicy.arn
}

resource "aws_iam_role_policy_attachment" "test" {
  role = aws_iam_role.ecs-CodeDeploy-Role.name
  policy_arn = aws_iam_policy.CodedeployRoleforECR.arn
}

resource "aws_iam_role_policy_attachment" "ECStask-att" {
  role = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
/*
resource "aws_iam_role_policy_attachment" "ECStaskrole_att" {
  role       = aws_iam_role.ecsTaskRole.name
  policy_arn = aws_iam_policy.ecsTaskPolicy.arn
}
*/

resource "aws_iam_role_policy_attachment" "codepipeline_att" {
  role       = aws_iam_role.codepipeline-role.name
  policy_arn = aws_iam_policy.codepipeline_policy.arn
}
