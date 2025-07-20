output "role_arn" {
  value = aws_iam_role.ecr_push_role.arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.github.arn
}
