# 2048 Game on Cloud-Native DevOps Stack

A small static game does not need Kubernetes, Terraform, ArgoCD, and security scanning to run. That is exactly why this project is useful for learning and portfolio building.

The application is intentionally simple: the classic 2048 game written in HTML, CSS, and JavaScript. The real value of the project is the DevOps workflow built around it.

## What I Built

I upgraded the 2048 game into a production-style DevOps project with:

- Docker containerization using NGINX
- Kubernetes manifests with probes, security context, HPA, PDB, and NetworkPolicy
- Terraform infrastructure for AWS EKS and ECR
- ArgoCD GitOps deployment
- GitHub Actions CI/CD
- Trivy vulnerability scanning
- CycloneDX SBOM generation
- CodeQL static code analysis
- AI-ready release summary automation

## Why This Project Matters

Many DevOps projects are hard to explain because the application logic is complex. This project keeps the application simple so the focus stays on the DevOps practices:

- How code becomes a container image
- How images are scanned before deployment
- How Kubernetes manifests are managed through Git
- How ArgoCD keeps the cluster aligned with the repository
- How Terraform makes cloud infrastructure reproducible
- How release summaries can be automated for platform teams

## What I Learned

The biggest lesson is that DevOps maturity is not only about the application. It is about the full path from commit to production:

```text
Commit -> Validate -> Build -> Scan -> Package -> Deploy -> Observe -> Improve
```

This is the same mindset used in real-world platform engineering teams.

## Future Enhancements

- Add a real domain with Route 53
- Add TLS using cert-manager
- Add Prometheus/Grafana dashboards
- Add CloudWatch Container Insights
- Add progressive delivery using Argo Rollouts
- Connect AI release summaries to an approved GenAI service
