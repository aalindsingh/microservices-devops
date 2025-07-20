variable "name" {
  type        = string
  description = "IAM Role name"
}

variable "oidc_provider_arn" {
  type = string
}

variable "oidc_provider_url" {
  type = string
}

variable "service_account_subject" {
  type        = string
  description = "The 'sub' for the SA, e.g. 'system:serviceaccount:kube-system:cluster-autoscaler'"
}

variable "policy_arns" {
  type        = list(string)
  description = "List of policy ARNs to attach"
}
