variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "environment" {
  type    = string
  default = "dev"
}
