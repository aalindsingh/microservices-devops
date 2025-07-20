module "vpc" {
  source               = "../modules/vpc"
  name                 = "sre"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  azs                  = ["us-east-1a", "us-east-1b"]
}

module "eks" {
  source             = "../modules/eks"
  cluster_name       = "sre-eks"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
  public_subnet_ids  = module.vpc.public_subnets
  environment        = "dev"
}

module "alb_irsa_role" {
  source = "../modules/iam_roles"

  name                    = "eks-alb-irsa"
  oidc_provider_arn       = module.eks.oidc_provider_arn
  oidc_provider_url       = module.eks.cluster_oidc_issuer_url
  service_account_subject = "system:serviceaccount:kube-system:aws-load-balancer-controller"
  policy_arns             = ["arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"]
}

module "autoscaler_irsa_role" {
  source = "../modules/iam_roles"

  name                    = "eks-autoscaler-irsa"
  oidc_provider_arn       = module.eks.oidc_provider_arn
  oidc_provider_url       = module.eks.cluster_oidc_issuer_url
  service_account_subject = "system:serviceaccount:kube-system:cluster-autoscaler"
  policy_arns = [
    "arn:aws:iam::aws:policy/AutoScalingFullAccess",
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ]
}

module "ecr_users" {
  source = "../modules/ecr"
  name   = "users-service"
}

module "ecr_orders" {
  source = "../modules/ecr"
  name   = "orders-service"
}

module "ecr_payments" {
  source = "../modules/ecr"
  name   = "payments-service"
}
