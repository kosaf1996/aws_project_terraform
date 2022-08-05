############################################################
#####                     Seoul                         ####
############################################################
resource "aws_lb_listener" "seoul-albli-blue" {
  load_balancer_arn = aws_alb.seoul-alb.arn
  port              = "${var.blue-port}"
  protocol          = "${var.lis-protocol}"
  depends_on = [
    aws_lb_target_group.seoul-django-app-blue
  ]
  default_action {
    type             = "${var.lis-action-type}"
    target_group_arn = aws_lb_target_group.seoul-django-app-blue.arn
  }
}

resource "aws_lb_listener" "seoul-albli-green" {
  load_balancer_arn = aws_alb.seoul-alb.arn
  port              = "${var.green-port}"
  protocol          = "${var.lis-protocol}"
  depends_on = [
    aws_lb_target_group.seoul-django-app-green
  ]
  default_action {
    type             = "${var.lis-action-type}"
    target_group_arn = aws_lb_target_group.seoul-django-app-green.arn
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_lb_listener" "tokyo-albli-blue" {
  provider          = aws.tokyo
  load_balancer_arn = aws_alb.tokyo-alb.arn
  port              = "${var.blue-port}"
  protocol          = "${var.lis-protocol}"
  depends_on = [
    aws_lb_target_group.tokyo-django-app-blue
  ]
  default_action {
    type             = "${var.lis-action-type}"
    target_group_arn = aws_lb_target_group.tokyo-django-app-blue.arn
  }
}

resource "aws_lb_listener" "tokyo-albli-green" {
  provider          = aws.tokyo
  load_balancer_arn = aws_alb.tokyo-alb.arn
  port              = "${var.green-port}"
  protocol          = "${var.lis-protocol}"
  depends_on = [
    aws_lb_target_group.tokyo-django-app-green
  ]
  default_action {
    type             = "${var.lis-action-type}"
    target_group_arn = aws_lb_target_group.tokyo-django-app-green.arn
  }
}
