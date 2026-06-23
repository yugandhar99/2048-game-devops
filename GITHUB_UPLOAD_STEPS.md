# GitHub Upload Steps - 2048 Game DevOps Final Version

Use this version for a fresh upload. It is cleaned for GitHub portfolio usage and avoids the previous Dependabot/noisy workflow failures.

## 1. Create a new empty GitHub repository

Repository name:

```text
2048-game-devops
```

Do not select README, .gitignore, or license during repo creation because this project already includes them.

## 2. Open CMD inside this extracted folder

Make sure you are inside the folder that contains:

```text
README.md
.github
game
k8s
infra
argocd
docs
```

## 3. Run Git commands

```bash
git init
git add .
git commit -m "Initial commit - 2048 Game DevOps Edition"
git branch -M main
git remote add origin https://github.com/yugandhar99/2048-game-devops.git
git push -u origin main
```

## 4. Expected Actions behavior

Only the lightweight `Portfolio Validation - 2048 Game DevOps` workflow runs automatically on push.

The heavier CodeQL and Terraform checks are manual/advisory to avoid red failures on first upload.

If you previously created Dependabot PRs in an older repo, close those PRs manually or delete/recreate the repo fresh.
