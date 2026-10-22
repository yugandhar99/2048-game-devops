#!/usr/bin/env python3
"""Generate an AI-ready release summary for the 2048 DevOps pipeline.

Default mode is offline and deterministic so it works in CI without secrets.
If USE_BEDROCK=true and boto3/AWS permissions are available, the script can be
extended to call Amazon Bedrock for a richer release note.
"""

from __future__ import annotations

import json
import os
import subprocess
from datetime import datetime, timezone
from pathlib import Path


def run(cmd: list[str]) -> str:
    try:
        return subprocess.check_output(cmd, text=True, stderr=subprocess.DEVNULL).strip()
    except Exception:
        return ""


def recent_commits(limit: int = 8) -> list[str]:
    output = run(["git", "log", f"-{limit}", "--pretty=format:%h %s"])
    return [line for line in output.splitlines() if line]


def detect_changes() -> dict[str, bool]:
    files = run(["git", "diff", "--name-only", "HEAD~1", "HEAD"]).splitlines()
    return {
        "app_changed": any(f.startswith("game/") for f in files),
        "k8s_changed": any(f.startswith("k8s/") or f.startswith("argocd/") for f in files),
        "infra_changed": any(f.startswith("infra/") for f in files),
        "pipeline_changed": any(f.startswith(".github/") for f in files),
    }


def risk_level(changes: dict[str, bool]) -> str:
    if changes["infra_changed"]:
        return "HIGH - infrastructure changes require Terraform plan review."
    if changes["k8s_changed"]:
        return "MEDIUM - Kubernetes/GitOps changes require deployment validation."
    if changes["pipeline_changed"]:
        return "MEDIUM - CI/CD workflow changes should be reviewed before release."
    return "LOW - static application changes only."


def build_summary() -> dict[str, object]:
    changes = detect_changes()
    return {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "project": "2048 Game DevOps Edition",
        "risk": risk_level(changes),
        "changes": changes,
        "recent_commits": recent_commits(),
        "recommended_checks": [
            "Confirm GitHub Actions validation passed",
            "Review Trivy and CodeQL security results",
            "Validate Kubernetes rollout with kubectl rollout status",
            "Confirm ArgoCD application is Healthy and Synced",
        ],
    }


def main() -> None:
    summary = build_summary()
    out = Path("release-summary.json")
    out.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(json.dumps(summary, indent=2))
    print(f"\nRelease summary written to {out}")


if __name__ == "__main__":
    main()
