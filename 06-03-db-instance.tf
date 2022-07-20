resource "aws_db_instance" "sda_db" {
  identifier = local.name

  instance_class         = "db.t3.micro"

  allocated_storage      = 10
  max_allocated_storage  = 50

  engine                 = "postgres"
  engine_version         = "14.1"

  port                   = 5432
  username               = "sda_root"
  password               = var.db_password

  multi_az               = true
  db_subnet_group_name   = module.sda-vpc.database_subnet_group
  vpc_security_group_ids = [module.security_group.security_group_id]

  parameter_group_name   = aws_db_parameter_group.sda.name
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = local.common_tags
}
