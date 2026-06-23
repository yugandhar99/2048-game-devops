# Architecture

This project keeps the application simple and focuses on a production-style DevOps workflow around it.

```text
User Browser
    |
    v
NGINX Ingress Controller / Load Balancer
    |
    v
Kubernetes Service
    |
    v
2048 Game Pods running NGINX unprivileged container
```

## Main Components

- **Static 2048 game**: HTML, CSS, and JavaScript.
- **Docker image**: NGINX unprivileged runtime serving static assets on port 8080.
- **Kubernetes**: Deployment, Service, Ingress, HPA, PDB, NetworkPolicy, and ServiceAccount.
- **ArgoCD**: GitOps controller that continuously syncs the desired Kubernetes state from Git.
- **Terraform**: AWS VPC, EKS Auto Mode, ECR, ingress controller, cert-manager, and ArgoCD.
- **GitHub Actions**: Validation, Docker build, Trivy scanning, SBOM generation, CodeQL, and Terraform quality checks.

## Why This Design

The app itself is intentionally lightweight. The value of this repository is showing how even a small static application can be packaged, secured, deployed, and operated using a cloud-native delivery model.
