resource "aws_ecr_repository" "ecr_repo" {
  name = var.django_ecr
  force_delete = true
  tags = {
    "Name" = "${var.django_ecr}"
  }
}