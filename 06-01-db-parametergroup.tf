resource "aws_db_parameter_group" "sda" {
  name   = "sda-db"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}