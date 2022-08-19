############################################################
#####                     Seoul                         ####
############################################################
resource "aws_db_subnet_group" "seoul_db_sub" {
  name       = "seoul-db-sub"
  subnet_ids = [aws_subnet.seoul-dba.id, aws_subnet.seoul-dbc.id]
  tags = {
    "Name" = "seoul-db-sub"
  }
}

resource "aws_db_instance" "seoul" {
  allocated_storage       = var.db-storage-size
  engine                  = var.db-engine
  engine_version          = var.db-engine-version
  instance_class          = var.db-instance
  storage_type            = var.db-storagy
  name                    = var.db-name
  identifier              = var.db-name
  username                = var.db-user
  password                = var.db-password
  db_subnet_group_name    = aws_db_subnet_group.seoul_db_sub.id
  vpc_security_group_ids  = [aws_security_group.seoul-sg.id]
  skip_final_snapshot     = true
  multi_az                = true
  backup_retention_period = 1
  publicly_accessible     = true
  tags = {
    "Name" = "seoul"
  }
}

resource "aws_db_instance" "seoul_rds" {
  allocated_storage = var.db-storage-size
  instance_class    = var.db-instance
  storage_type      = var.db-storagy
  identifier        = "seoul-rds"

  db_subnet_group_name   = aws_db_subnet_group.seoul_db_sub.id
  vpc_security_group_ids = [aws_security_group.seoul-sg.id]
  replicate_source_db    = aws_db_instance.seoul.arn
  tags = {
    "Name" = "seoul-rds"
  }
}


############################################################
#####                     Tokyo                         ####
############################################################
resource "aws_db_subnet_group" "tokyo_db_sub" {
  name       = "tokyo-db-sub"
  subnet_ids = [aws_subnet.tokyo-dba.id, aws_subnet.tokyo-dbc.id]
  provider   = aws.tokyo
  tags = {
    "Name" = "tokyo-db-sub"
  }
}

resource "aws_db_instance" "tokyo_rds" {
  provider                  = aws.tokyo
  allocated_storage         = var.db-storage-size
  instance_class            = var.db-instance
  storage_type              = var.db-storagy
  identifier                = "tokyo-rds"
  availability_zone         = var.tokyo-az["aza"]
  db_subnet_group_name      = aws_db_subnet_group.tokyo_db_sub.id
  vpc_security_group_ids    = [aws_security_group.tokyo-sg.id]
  replicate_source_db       = aws_db_instance.seoul.arn
  final_snapshot_identifier = false
  skip_final_snapshot       = false
  tags = {
    "Name" = "tokyo-rds"
  }
}

resource "aws_db_instance_automated_backups_replication" "tokyo_re" {
  source_db_instance_arn = aws_db_instance.seoul.arn
  provider               = aws.tokyo
}
