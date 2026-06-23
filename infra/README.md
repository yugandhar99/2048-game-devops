# Terraform Infrastructure - 2048 Game DevOps

This folder contains Terraform configuration for the AWS infrastructure used by the 2048 Game DevOps project.

## What It Creates

- VPC with public and private subnets
- EKS cluster configuration
- ECR repository for the game image
- NGINX ingress controller
- cert-manager
- ArgoCD installation and application bootstrap

## Prerequisites

- AWS CLI configured
- Terraform installed
- kubectl installed
- IAM permissions to create VPC, EKS, ECR, IAM, and related resources

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

## Remote State

Terraform state should not be committed to GitHub. Use a remote backend such as S3 with locking for real usage.

An example backend file is provided:

```text
backend.tf.example
```

Rename it to `backend.tf` and update the bucket/key/region values after creating your backend resources.

## Cost Notes

This project may create AWS resources that cost money, especially EKS, NAT Gateway, load balancers, and CloudWatch logs.

For learning/demo usage:

```hcl
enable_single_nat_gateway = true
enable_cluster_logs       = false
enable_monitoring         = false
```

For production-like high availability, review NAT Gateway, logging, and monitoring settings carefully.

## Cleanup

```bash
terraform destroy
```
