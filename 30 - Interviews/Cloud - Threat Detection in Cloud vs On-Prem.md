---
type: interview-question
question: "How does threat detection differ in the cloud versus on-prem?"
domain: [cloud, analyst]
role: [soc-analyst, principal-analyst-l3, security-engineer]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How does threat detection differ in the cloud versus on-prem?

## ✅ Quick Answer
In the cloud the primary telemetry shifts from host and network logs to the **control-plane API** — CloudTrail, Azure Activity, GCP Audit logs — and identity becomes the new perimeter. You lose some low-level network visibility but gain rich API auditing. The dominant threats are misconfiguration, credential/key compromise, and IAM privilege escalation, so detections center on anomalous API calls and identity behavior.

## 🗣️ Talking points
- Log sources: CloudTrail, GuardDuty, VPC Flow Logs, Azure Activity/Defender, GCP Audit Logs.
- Identity-centric detections: leaked access keys, `AssumeRole` abuse, privilege escalation, MFA disabled, new IAM users/keys.
- Ephemeral, auto-scaling assets break host-based assumptions and complicate forensics.
- Shared responsibility limits what you can see below the service line.
- High-value detections: impossible travel, API calls from new regions/ASNs, mass S3 access, and disabling logging (a defense-evasion tell).

## ⚠️ Follow-ups they'll hit you with
- What would credential theft actually look like in CloudTrail?
- How do ephemeral workloads change your forensic approach?

## 🔗 Related
- [[Cloud - AWS Shared Responsibility Model]]
- [[Analyst - Detecting Data Exfiltration]]
