module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = var.cluster_name
  subnet_ids   = concat(var.private_subnet_ids, var.public_subnet_ids)
  vpc_id       = var.vpc_id

  enable_irsa                          = true
  cluster_endpoint_private_access      = false
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      min_capacity     = 2
      max_capacity     = 4

      instance_types = ["t3.medium"]
      name           = "${var.cluster_name}-ng"
    }
  }

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
