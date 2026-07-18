# =============================================================================
# INPUT VARIABLES
# =============================================================================

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-west-2"


  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]$", var.aws_region))
    error_message = "aws_region must be a valid AWS region such as us-west-2."
  }
}

variable "cluster_name" {
  description = "Base name of the EKS cluster"
  type        = string
  default     = "2048-game"

  validation {
    condition     = can(regex("^[a-zA-Z0-9-]{3,32}$", var.cluster_name))
    error_message = "cluster_name must be 3-32 characters and contain only letters, numbers, and hyphens."
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS cluster"
  type        = string
  default     = "1.33"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "argocd_namespace" {
  description = "Namespace to install ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "ArgoCD Helm chart version"
  type        = string
  default     = "7.7.11"
}

variable "enable_single_nat_gateway" {
  description = "Use a single NAT gateway to reduce costs. Use false for higher availability production clusters."
  type        = bool
  default     = true
}

variable "enable_monitoring" {
  description = "Enable optional monitoring stack. This increases AWS cost."
  type        = bool
  default     = false
}

variable "enable_cluster_logs" {
  description = "Enable EKS control plane logs. This increases CloudWatch cost."
  type        = bool
  default     = false
}

variable "cluster_log_types" {
  description = "EKS control plane log types to enable when enable_cluster_logs is true"
  type        = list(string)
  default     = ["api", "audit", "authenticator"]
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository used when publishing images to AWS ECR"
  type        = string
  default     = "game-2048"
}

variable "extra_tags" {
  description = "Additional tags to apply to AWS resources"
  type        = map(string)
  default     = {}
}
