# Portfolio Notes - 2048 Game DevOps Edition

## Project Summary

This project converts the classic 2048 static browser game into a modern DevOps portfolio project. The application remains simple, but the delivery platform around it is upgraded with Docker, Kubernetes, Terraform, ArgoCD GitOps, GitHub Actions, security scanning, SBOM generation, and AI-ready release summaries.

## Best GitHub Repository Name

```text
2048-game-devops
```

## GitHub Repository Description

```text
2048 game DevOps project using Docker, Kubernetes, Terraform, AWS EKS, ArgoCD GitOps, GitHub Actions, Trivy, CodeQL, SBOM generation, and AI-ready release summaries.
```

## Resume Bullet

```text
Productionized a static 2048 game into a cloud-native DevOps project using Docker, Kubernetes, Terraform, AWS EKS, ArgoCD GitOps, GitHub Actions CI/CD, Trivy vulnerability scanning, CodeQL, CycloneDX SBOM generation, and AI-ready release summaries.
```

## Interview Explanation

I used a simple 2048 static game as the application layer, but the main focus was building a real DevOps delivery workflow around it. I containerized the app with an unprivileged NGINX image, added health checks and security headers, and deployed it to Kubernetes with probes, resource limits, HPA, PDB, and NetworkPolicy.

On the platform side, I added Terraform for AWS EKS/ECR infrastructure, ArgoCD for GitOps deployment, and GitHub Actions for validation, Docker build, Trivy security scanning, SBOM generation, CodeQL, and Terraform quality checks. I also added an AI-ready release summary script to show how modern teams can summarize release risk and deployment readiness.

## Career Progression Value

This project is useful because it shows progression from basic Docker/container knowledge into platform engineering practices:

- Basic app containerization
- Kubernetes deployment readiness
- GitOps deployment model
- Terraform IaC
- DevSecOps scanning
- Supply-chain visibility using SBOM
- AI-assisted release operations

## Screenshots to Add Later

- Game running locally
- GitHub Actions pipeline passing
- ArgoCD Healthy/Synced application
- EKS pods and services
- Docker image in registry
- Trivy scan or GitHub Security tab
