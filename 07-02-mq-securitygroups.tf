/*module "mq_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  name        = "${local.name}-mq-security-group"
  description = "Complete RabbitMQ example security group"
  vpc_id      = module.sda-vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5672
      to_port     = 5672
      protocol    = "tcp"
      description = "RabbitMQ access from within VPC"
      cidr_blocks = module.sda-vpc.vpc_cidr_block
    },
    {
      from_port   = 15672
      to_port     = 15672
      protocol    = "tcp"
      description = "RabbitMQ Console access from within VPC"
      cidr_blocks = module.sda-vpc.vpc_cidr_block
    },
  ]

  tags = local.common_tags
}
*/