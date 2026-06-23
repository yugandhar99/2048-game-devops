# GenAI Enhancement Idea

This project includes an optional AI-ready release summary script:

```bash
python scripts/genai_release_summary.py
```

The current script works in offline mode and summarizes:

- Recent commits
- Whether app, Kubernetes, Terraform, or pipeline files changed
- Release risk level
- Recommended validation checks

## How this can be extended

In a real platform environment, the JSON output can be sent to Amazon Bedrock, Azure OpenAI, or another approved internal AI service to generate:

- Release notes
- Change-risk summaries
- Deployment readiness notes
- Rollback guidance
- Incident handoff summaries

No API key or model credential is stored in this repository.
