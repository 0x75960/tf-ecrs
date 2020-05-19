resource "aws_ecr_repository" "repos" {
  for_each = var.images

  name                 = "${var.image-scope}/${each.value}"
  image_tag_mutability = var.immutable ? "IMMUTABLE" : "MUTBALE"

  image_scanning_configuration {
    scan_on_push = var.scanning
  }
}

resource "aws_ecr_repository_policy" "admin-policies" {
  for_each   = aws_ecr_repository.repos
  repository = each.value.name
  policy     = data.aws_iam_policy_document.accessor.json
}

output "repositories" {
  value = {
    for image in var.images :
    image => {
      url = aws_ecr_repository.repos[image].repository_url
      arn = aws_ecr_repository.repos[image].arn
    }
  }
}
