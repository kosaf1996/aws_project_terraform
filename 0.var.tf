############################################################
#####                     Seoul                         ####
############################################################

###cidr-block
variable "seoul-cidr-block" {
  type = map(any)
  default = {
    vpc  = "100.0.0.0/16"
    puba = "100.0.0.0/24"
    ecsa = "100.0.1.0/24"
    ecsc = "100.0.2.0/24"
    dba  = "100.0.3.0/24"
    dbc  = "100.0.4.0/24"
  }
}

variable "seoul-az" {
  type = map(any)
  default = {
    "aza" = "ap-northeast-2a"
    "azb" = "ap-northeast-2b"
    "azc" = "ap-northeast-2c"
    "azd" = "ap-northeast-2d"
  }
}

############################################################
#####                     Tokyo                         ####
############################################################

### cidr-block
variable "tokyo-cidr-block" {
  type = map(any)
  default = {
    vpc  = "200.0.0.0/16"
    puba = "200.0.0.0/24"
    ecsa = "200.0.1.0/24"
    ecsc = "200.0.2.0/24"
    dba = "200.0.3.0/24"
  }
}


variable "tokyo-az" {
  type = map(any)
  default = {
    "aza" = "ap-northeast-1a"
    "azb" = "ap-northeast-1b"
    "azc" = "ap-northeast-1c"
    "azd" = "ap-northeast-1d"
  }
}

############################################################
#####                     Global                        ####
############################################################
###EC2
variable "instance_type" {
  type    = string
  default = "t2.micro"
}


###Security Group Port
variable "all-cidr" {
  type    = string
  default = "0.0.0.0/0"
}
variable "efs-port" {
  default = 2049
}
variable "http-port" {
  default = 80
}
variable "postsql-port" {
  default = 5432
}
variable "ssh-port" {
  default = 22
}


###AMI
variable "seoul-ami" {
  type = string
  default = "ami-01711d925a1e4cc3a"
}

variable "tokyo-ami" {
  type = string
  default = "ami-0ecb2a61303230c9d"
  
}
###CICD
variable "django_app" {
  type    = string
  default = "django-app"
}
variable "django_ecr" {
  type    = string
  default = "django_app"
}
variable "green-port" {
  default = 10080
}
variable "blue-port" {
  default = 80
}

data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}


###ALB Health Check
variable "health-check-path" {
  type    = string
  default = "/"
}
variable "health-threshold-check" {
  default = 3
}
variable "health-interval-check" {
  default = 5
}
variable "health-matcher" {
  type = string
  default = "200"
}
variable "health-protocol" {
  type = string
  default = "HTTP"
}
variable "health-timeout" {
  default = 2
}
variable "health-unhealthy" {
  default = 3
}
variable "health-port" {
  type = string
  default = "traffic-port"
}

###ALB Listner 
variable "lis-protocol" {
  type = string
  default = "HTTP"
}
variable "lis-action-type" {
  type = string
  default = "forward"
}

###EFS Policy
variable "efs-posix" {
   type = string
   default = "1100"
}
variable "efs-posix-premissions" {
   type = string
   default = "0755"
}


####Key-pare
variable "key-name" {
  type = string
  default = "django-app-key"
}
variable "key-path" {
  type = string
  default = "../../../../Users/GM/.ssh/gmgu.pub"
}
