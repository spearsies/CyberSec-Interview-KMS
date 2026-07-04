---
type: interview-question
question: "What AWS security services and IAM best practices matter for detection?"
domain: [cloud, analyst, engineering]
role: [soc-analyst, principal-analyst-l3, security-engineer]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What AWS security services and IAM best practices matter for detection?

## ✅ Quick Answer
For visibility: **CloudTrail** (API audit — the backbone), **GuardDuty** (managed threat detection), **Config** (drift/misconfig), **Security Hub** (aggregation), and **VPC Flow Logs** (network). For IAM: least privilege, roles and short-lived STS credentials over long-lived keys, MFA on privileged and root accounts, no daily root use, rotate/eliminate access keys, and guardrails via permission boundaries and SCPs.

## 🗣️ Talking points
- CloudTrail records who made which API call — enable multi-region + log-file validation.
- GuardDuty flags behavior (crypto-mining, credential exfil, recon) CloudTrail alone won't.
- Config rules catch drift; Security Hub centralizes findings.
- Prefer roles + STS temporary credentials to static access keys.
- MFA everywhere privileged; lock away root.
- SCPs set org-wide guardrails; watch for CloudTrail being disabled (defense evasion).

## ⚠️ Follow-ups they'll hit you with
- What does GuardDuty catch that CloudTrail alone won't?
- Why prefer roles over access keys?

## 🔗 Related
- [[Cloud - AWS Shared Responsibility Model]]
- [[Cloud - Threat Detection in Cloud vs On-Prem]]
