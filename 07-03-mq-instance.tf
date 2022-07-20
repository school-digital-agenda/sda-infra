resource "aws_mq_broker" "sda_mq" {
  broker_name = "${local.name}-sda-mq"

  engine_type        = "RabbitMQ"
  engine_version     = "3.9.16"
  host_instance_type = "mq.t3.micro"
  security_groups    = [module.mq_security_group.security_group_id]
  deployment_mode    = "SINGLE_INSTANCE"
  subnet_ids         = [module.sda-vpc.private_subnets[0]]

  user {
    username = "sda_root"
    password = var.mq_password
  }
}