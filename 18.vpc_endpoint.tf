############################################################
#####                     Seoul                         ####
############################################################
resource "aws_vpc_endpoint" "seoul-django-vpce-ecr-api" {
  vpc_id             = aws_vpc.seoul-vpc.id
  service_name       = "com.amazonaws.ap-northeast-2.ecr.api"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.seoul-ecsa.id, aws_subnet.seoul-ecsc.id]
  security_group_ids = [aws_security_group.seoul-sg.id]
  tags = {
    "Name" = "seoul-django-vpce-ecr-api"
  }
}

resource "aws_vpc_endpoint" "seoul-djago-vpcep-int-dkr" {
  vpc_id             = aws_vpc.seoul-vpc.id
  service_name       = "com.amazonaws.ap-northeast-2.ecr.dkr"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.seoul-ecsa.id, aws_subnet.seoul-ecsc.id]
  security_group_ids = [aws_security_group.seoul-sg.id]
  tags = {
    "Name" = "seoul-django-vpce-ecr-dkr"
  }
}

resource "aws_vpc_endpoint" "seoul-django-vpcep-gat-s3" {
  vpc_id          = aws_vpc.seoul-vpc.id
  service_name    = "com.amazonaws.ap-northeast-2.s3"
  route_table_ids = [aws_route_table.seoul-rt.id]
  tags = {
    "Name" = "seoul-django-vpcep-gat-s3"
  }
}

resource "aws_vpc_endpoint" "seoul-django-vpce-logs" {
  vpc_id             = aws_vpc.seoul-vpc.id
  service_name       = "com.amazonaws.ap-northeast-2.logs"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.seoul-ecsa.id, aws_subnet.seoul-ecsc.id]
  security_group_ids = [aws_security_group.seoul-sg.id]
  tags = {
    "Name" = "seoul-django-vpce-logs"
  }
}

############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_vpc_endpoint" "tokyo-django-vpce-ecr-api" {
  provider           = aws.tokyo
  vpc_id             = aws_vpc.tokyo-vpc.id
  service_name       = "com.amazonaws.ap-northeast-1.ecr.api"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.tokyo-ecsa.id, aws_subnet.tokyo-ecsc.id]
  security_group_ids = [aws_security_group.tokyo-sg.id]
  tags = {
    "Name" = "tokyo-django-vpce-ecr-api"
  }
}

resource "aws_vpc_endpoint" "tokyo-djago-vpcep-int-dkr" {
  provider           = aws.tokyo
  vpc_id             = aws_vpc.tokyo-vpc.id
  service_name       = "com.amazonaws.ap-northeast-1.ecr.dkr"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.tokyo-ecsa.id, aws_subnet.tokyo-ecsc.id]
  security_group_ids = [aws_security_group.tokyo-sg.id]
  tags = {
    "Name" = "tokyo-django-vpce-ecr-dkr"
  }
}

resource "aws_vpc_endpoint" "tokyo-django-vpcep-gat-s3" {
  provider        = aws.tokyo
  vpc_id          = aws_vpc.tokyo-vpc.id
  service_name    = "com.amazonaws.ap-northeast-1.s3"
  route_table_ids = [aws_route_table.tokyo-rt.id]
  tags = {
    "Name" = "tokyo-django-vpcep-gat-s3"
  }
}

resource "aws_vpc_endpoint" "tokyo-django-vpce-logs" {
  provider           = aws.tokyo
  vpc_id             = aws_vpc.tokyo-vpc.id
  service_name       = "com.amazonaws.ap-northeast-1.logs"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.tokyo-ecsa.id, aws_subnet.tokyo-ecsc.id]
  security_group_ids = [aws_security_group.tokyo-sg.id]
  tags = {
    "Name" = "tokyo-django-vpce-logs"
  }
}
