resource "aws_ecr_repository" "sda-bootstrap-api" {
  name                 = "sda-bootstrap-api"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "sda-config-server" {
  name                 = "sda-config-server"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}
