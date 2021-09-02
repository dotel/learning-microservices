# Creates a container registry on Azure so that you can publish your Docker images.


resource "aws_ecr_repository" "container_registry" {
  name                 = "veryprivate"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}


