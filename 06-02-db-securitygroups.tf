/*module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9"

  name        = "${local.name}-db-security-group"
  description = "Complete PostgreSQL example security group"
  vpc_id      = module.sda-vpc.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "PostgreSQL access from within VPC"
      cidr_blocks = module.sda-vpc.vpc_cidr_block
    },
  ]

  tags = local.common_tags
}
*/