output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

output "node_group_role_arn" {
  value = module.eks.node_group_role_arn
}

output "alb_role_arn" {
  value = module.alb_irsa_role.role_arn
}

output "autoscaler_role_arn" {
  value = module.autoscaler_irsa_role.role_arn
}

output "users_repository_url" {
  value = module.ecr_users.repository_url
}

output "orders_repository_url" {
  value = module.ecr_orders.repository_url
}

output "payments_repository_url" {
  value = module.ecr_payments.repository_url
}

output "ecr_role_arn" {
  value = module.github_oidc_role.role_arn
}
