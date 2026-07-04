---
type: interview-question
question: "What is Sigma and how do you use it for portable detections?"
domain: [engineering, analyst, threat-hunting]
role: [soc-analyst, principal-analyst-l3, security-engineer]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What is Sigma and how do you use it for portable detections?

## ✅ Quick Answer
Sigma is an open, vendor-agnostic YAML format for SIEM detection rules — "the YARA of logs." You write the logic once and convert it (via pySigma/sigmac backends) to Splunk SPL, KQL, Elastic, and others, so you avoid lock-in and can share rules through the SigmaHQ community repo. Each rule carries a logsource, a detection block, and ATT&CK tags.

## 🗣️ Talking points
- Structure: `logsource`, `detection` (selection + condition), `level`, ATT&CK `tags`.
- Backends/pipelines convert to your target platform's query language.
- Community sharing accelerates coverage of new threats.
- Caveats: field-mapping differences and backend limitations — always test the converted output.

## ⚠️ Follow-ups they'll hit you with
- What are the limits of automatic conversion?
- How do you map Sigma fields to your own data model?

## 🔗 Related
- [[Sigma Rule Format]]
- [[DetectionEng - What Is Detection-as-Code]]
