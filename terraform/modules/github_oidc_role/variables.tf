variable "role_name" {
  type        = string
  description = "Name of the IAM role"
}

variable "repo_name" {
  type        = string
  description = "GitHub repo in format: org/repo"
}

variable "account_id" {
  type        = string
  description = "AWS Account ID"
}
