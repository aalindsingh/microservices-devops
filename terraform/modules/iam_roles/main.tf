data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"
      values   = [var.service_account_subject]
    }
  }
}

resource "aws_iam_role" "irsa" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {
    Name = var.name
  }
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  for_each   = toset(var.policy_arns)
  policy_arn = each.value
  role       = aws_iam_role.irsa.name
}
