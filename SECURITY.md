# Security Policy

## Security Practices Used

- No Terraform state files committed to Git
- No AWS access keys committed to Git
- GitHub Actions configured for security scanning
- Trivy filesystem scan and SBOM generation
- CodeQL static analysis for JavaScript
- Kubernetes pods run as non-root where possible
- Service account token automount disabled for the static app
- NetworkPolicy, PodDisruptionBudget, probes, and resource limits included
- NGINX security headers configured for the static site

## Reporting Issues

Please open a GitHub issue if you find a security or configuration issue in this portfolio project.

Do not include secrets, tokens, or account-specific values in GitHub issues.
