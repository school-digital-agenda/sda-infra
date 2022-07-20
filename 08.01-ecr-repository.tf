resource "aws_ecr_repository" "sda-bootstrap-api" {
  name                 = "sda-bootstrap-api"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
