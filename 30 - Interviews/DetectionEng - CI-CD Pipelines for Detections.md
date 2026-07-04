---
type: interview-question
question: "How do you build a CI/CD pipeline for detection rules?"
domain: [engineering, analyst]
role: [principal-analyst-l3, security-engineer]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you build a CI/CD pipeline for detection rules?

## ✅ Quick Answer
A detection pipeline lints and tests every rule change on a pull request, then converts and deploys to the SIEM on merge, with staged rollout and rollback. Typical stages: syntax/schema lint → unit tests → (Sigma) convert → deploy to a test workspace → smoke test → promote to prod. Git stays the source of truth and every change is auditable.

## 🗣️ Talking points
- PR triggers CI; lint + unit tests are merge gates.
- Sigma conversion step targets the platform query language.
- Deploy via API or IaC (Terraform, Sentinel repos connector, Elastic detection API).
- Canary / staged rollout before full production.
- Automatic rollback on failure; full audit trail from Git history.

## ⚠️ Follow-ups they'll hit you with
- How do you roll back a bad rule quickly?
- How do you deploy rules to Sentinel or Splunk programmatically?

## 🔗 Related
- [[DetectionEng - What Is Detection-as-Code]]
- [[DetectionEng - Testing Detections Before Deployment]]
