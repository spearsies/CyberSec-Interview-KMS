---
type: interview-question
question: "How does the shared responsibility model differ across Azure and AWS?"
domain: [cloud, analyst]
role: [soc-analyst, principal-analyst-l3, security-engineer]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How does the shared responsibility model differ across Azure and AWS?

## ✅ Quick Answer
The principle is identical — the provider secures *of* the cloud, you secure *in* the cloud — and both shift more to the provider as you move IaaS → PaaS → SaaS. The differences are terminology and telemetry: AWS uses CloudTrail/GuardDuty/IAM, Azure uses Activity Logs/Defender for Cloud/Entra ID, and Azure leans heavily on identity. The customer *always* owns data, identity, and access configuration.

## 🗣️ Talking points
- Same model, different service names and log sources.
- The IaaS → PaaS → SaaS gradient shifts responsibility upward to the provider.
- Constant across every model: you own your data and IAM config.
- Azure is identity-centric (Entra ID, Conditional Access) vs AWS IAM.
- For multi-cloud monitoring, map equivalent services to a common detection layer.

## ⚠️ Follow-ups they'll hit you with
- Who patches the OS under a PaaS service?
- What responsibility never shifts to the provider?

## 🔗 Related
- [[Cloud - AWS Shared Responsibility Model]]
- [[Cloud - Threat Detection in Cloud vs On-Prem]]
