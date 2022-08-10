############################################################
#####                     Seoul                         ####
############################################################
# Codepipeline Source 단계의 Github 연결 생성
# Pending 상태로 생성되며 AWS Console에서만 Available로 Update 가능
# https://docs.aws.amazon.com/dtconsole/latest/userguide/connections-update.html
resource "aws_codestarconnections_connection" "github-connection" {
  name          = "django-project"
  provider_type = "GitHub"
}
