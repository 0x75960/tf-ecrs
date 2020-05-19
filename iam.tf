data aws_iam_policy_document "assume_accessor" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
    ]
    principals {
      type        = "Service"
      identifiers = [var.service-assume-role]
    }
  }
}

resource "aws_iam_role" "accessor" {
  name               = var.accessor-role
  assume_role_policy = data.aws_iam_policy_document.assume_accessor.json
}

data "aws_iam_policy_document" "accessor" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [aws_iam_role.accessor.arn]
      type        = "AWS"
    }
    actions = [
      "ecr:*"
    ]
  }
}

output "accessor-role" {
  value = {
    arn  = aws_iam_role.accessor.arn
    name = aws_iam_role.accessor.name
  }
}
