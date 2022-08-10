############################################################
#####                     Seoul                         ####
############################################################
#보안 그룹 
resource "aws_security_group" "seoul-sg" {
  name        = "seoul-sg"
  description = "Allow 80, 5432, icmp"
  vpc_id      = aws_vpc.seoul-vpc.id

  ingress = [
    {
      description      = "ssh"
      from_port        = "${var.ssh-port}"
      to_port          = "${var.ssh-port}"
      protocol         = "tcp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    { 
      description      = "HTTP"
      from_port        = "${var.http-port}"
      to_port          = "${var.http-port}"
      protocol         = "tcp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
        {
      description      = "ICMP"
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    { 
      description      = "EFS"
      from_port        = "${var.efs-port}"
      to_port          = "${var.efs-port}"
      protocol         = "tcp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    { description      = "postgresql"
      from_port        = "${var.postsql-port}"
      to_port          = "${var.postsql-port}"
      protocol         = "tcp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }

  ]

  egress = [{
    description      = "all"
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["${var.all-cidr}"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = null
    security_groups  = null
    self             = null

  }]

  tags = {
    "Name" = "seoul-sg"
  }
}
############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_security_group" "tokyo-sg" {
  provider = aws.tokyo
  name        = "tokyo-sg"
  description = "Allow 22,80,5432,icamp"
  vpc_id      = aws_vpc.tokyo-vpc.id

 ingress = [
    {
      description      = "ssh"
      from_port        = "${var.ssh-port}"
      to_port          = "${var.ssh-port}"
      protocol         = "tcp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    { 
      description      = "HTTP"
      from_port        = "${var.http-port}"
      to_port          = "${var.http-port}"
      protocol         = "tcp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
        {
      description      = "ICMP"
      from_port        = -1
      to_port          = -1
      protocol         = "icmp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    { 
      description      = "EFS"
      from_port        = "${var.efs-port}"
      to_port          = "${var.efs-port}"
      protocol         = "tcp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    { description      = "postgresql"
      from_port        = "${var.postsql-port}"
      to_port          = "${var.postsql-port}"
      protocol         = "tcp"
      cidr_blocks      = ["${var.all-cidr}"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }

  ]

  egress = [{
    description      = "all"
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["${var.all-cidr}"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = null
    security_groups  = null
    self             = null

  }]

  tags = {
    "Name" = "tokyo-sg"
  }
}
