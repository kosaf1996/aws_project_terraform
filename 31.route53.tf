############################################################
#####                     Hosting                       ####
############################################################
resource "aws_route53_zone" "route53" {
  name = var.route53-dns #DNS Name
}

############################################################
#####                     Seoul                         ####
############################################################
resource "aws_route53_record" "primary" {
  zone_id = aws_route53_zone.route53.zone_id #DNS zone_id
  name    = var.route53-dns                  #DNS Name
  type    = var.route53-record               #Record Type
  alias {
    name                   = aws_alb.seoul-alb.dns_name #DNS Name
    zone_id                = aws_alb.seoul-alb.zone_id  #Zone ID
    evaluate_target_health = true                       #Route53 Health Check 
  }
  failover_routing_policy { #Route53 장애조치 정책 
    type = "PRIMARY"        #기본 라우팅 
  }
  set_identifier  = var.seoul-resion                               #라우팅 정책 고유 식별자 
  health_check_id = aws_route53_health_check.souel_health_check.id #Health Chesk Resource
}

resource "aws_route53_health_check" "souel_health_check" { #Health Check 
  fqdn              = aws_alb.seoul-alb.dns_name           #확인할 DNS Name
  port              = var.route53-port                     #확인할 Port
  type              = var.route53-type                     #확인할 Protocol Type
  resource_path     = var.route53-resource-path            #확인할 Path
  failure_threshold = var.route53-failure-threshold        #Healtch Check Fail Count
  request_interval  = var.route53-request-interval         #Health Check Time 
  tags = {
    "Name" = "souel-health-check"
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_route53_record" "secondary" {
  zone_id = aws_route53_zone.route53.zone_id
  name    = var.route53-dns
  type    = var.route53-record
  alias {
    name                   = aws_alb.tokyo-alb.dns_name
    zone_id                = aws_alb.tokyo-alb.zone_id
    evaluate_target_health = true
  }
  failover_routing_policy {
    type = "SECONDARY"
  }
  set_identifier  = var.tokyo-resion
  health_check_id = aws_route53_health_check.tokyo_health_check.id
}

resource "aws_route53_health_check" "tokyo_health_check" {
  fqdn              = aws_alb.tokyo-alb.dns_name
  port              = var.route53-port
  type              = var.route53-type
  resource_path     = var.route53-resource-path
  failure_threshold = var.route53-failure-threshold
  request_interval  = var.route53-request-interval
  tags = {
    "Name" = "tokyo-health-check"
  }
}
