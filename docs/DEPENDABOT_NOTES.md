# Dependabot Notes

Dependabot is intentionally disabled in this final GitHub-ready version.

Reason: in portfolio repositories, Dependabot may immediately open several pull requests for GitHub Actions or Terraform modules. Those PRs can trigger workflow checks and create red failures before the project is fully configured.

A safer optional example is available at:

```text
.github/dependabot.yml.disabled-example
```

To enable it later, rename it to:

```text
.github/dependabot.yml
```

Recommended approach:

- Enable Dependabot only after the repository is stable.
- Review major version upgrades manually.
- Avoid merging automatic Terraform module major upgrades without running `terraform plan`.
