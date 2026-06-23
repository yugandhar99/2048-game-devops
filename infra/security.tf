# =============================================================================
# SECURITY NOTES
# =============================================================================
# The EKS module and the ingress controller create the security groups required
# for cluster communication and load balancer access. This project intentionally
# avoids broad internet ingress rules on the EKS cluster security group.
#
# For production, restrict public access to trusted CIDR ranges, enable cluster
# audit logs, and use AWS WAF/ALB where applicable.
