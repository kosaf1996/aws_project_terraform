############################################################
#####                     Seoul                         ####
############################################################
resource "aws_lb_target_group" "seoul-django-app-blue" {
  name        = "seoul-django-app-blue"
  port        = "${var.blue-port}"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.seoul-vpc.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = "${var.health-threshold-check}"
    interval            = "${var.health-interval-check}"
    matcher             = "${var.health-matcher}"
    path                = "${var.health-check-path}"
    port                = "${var.health-port}"
    protocol            = "${var.health-protocol}"
    timeout             = "${var.health-timeout}"
    unhealthy_threshold = "${var.health-unhealthy}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "seoul-django-app-green" {
  name        = "seoul-django-app-green"
  port        = "${var.green-port}"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.seoul-vpc.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = "${var.health-threshold-check}"
    interval            = "${var.health-interval-check}"
    matcher             = "${var.health-matcher}"
    path                = "${var.health-check-path}"
    port                = "${var.health-port}"
    protocol            = "${var.health-protocol}"
    timeout             = "${var.health-timeout}"
    unhealthy_threshold = "${var.health-unhealthy}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_lb_target_group" "tokyo-django-app-blue" {
  provider    = aws.tokyo
  name        = "tokyo-django-app-blue"
  port        = "${var.blue-port}"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.tokyo-vpc.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = "${var.health-threshold-check}"
    interval            = "${var.health-interval-check}"
    matcher             = "${var.health-matcher}"
    path                = "${var.health-check-path}"
    port                = "${var.health-port}"
    protocol            = "${var.health-protocol}"
    timeout             = "${var.health-timeout}"
    unhealthy_threshold = "${var.health-unhealthy}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group" "tokyo-django-app-green" {
  provider    = aws.tokyo
  name        = "tokyo-django-app-green"
  port        = "${var.green-port}"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.tokyo-vpc.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = "${var.health-threshold-check}"
    interval            = "${var.health-interval-check}"
    matcher             = "${var.health-matcher}"
    path                = "${var.health-check-path}"
    port                = "${var.health-port}"
    protocol            = "${var.health-protocol}"
    timeout             = "${var.health-timeout}"
    unhealthy_threshold = "${var.health-unhealthy}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
