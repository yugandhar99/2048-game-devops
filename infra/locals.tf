# =============================================================================
# LOCAL VALUES AND DATA SOURCES
# =============================================================================

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  # Cluster configuration with unique suffix to avoid resource collisions.
  cluster_name = "${var.cluster_name}-${random_string.suffix.result}"

  # Network configuration.
  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 10)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]

  # Avoid timestamp() in tags because it causes Terraform drift on every plan.
  common_tags = {
    Environment = var.environment
    Project     = "2048-game"
    ManagedBy   = "terraform"
    CreatedBy   = "Yugandhar"
    Owner       = data.aws_caller_identity.current.user_id
  }

  stable_tags = merge(local.common_tags, var.extra_tags)

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
