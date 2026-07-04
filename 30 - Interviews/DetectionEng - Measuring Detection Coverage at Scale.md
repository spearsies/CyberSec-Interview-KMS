---
type: interview-question
question: "How do you measure detection coverage and quality across a large rule set?"
domain: [engineering, analyst, threat-hunting]
role: [principal-analyst-l3, security-engineer]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you measure detection coverage and quality across a large rule set?

## ✅ Quick Answer
Map every detection to ATT&CK and visualize the heatmap (Navigator) to expose blind spots — but *weight* it. Prioritize coverage of the techniques your threat model cares about, and distinguish "we have a rule" from "we have a tested, high-precision rule backed by a real data source." Tools like MITRE DeTT&CT track the data-source quality underneath the coverage.

## 🗣️ Talking points
- ATT&CK Navigator heatmap for coverage and gaps.
- Don't chase 100% — prioritize by threat intel and likelihood/impact.
- Data-source coverage (DeTT&CT) underpins detection coverage — no telemetry, no detection.
- Separate coverage *breadth* from *confidence* (tested + precise).
- Track precision, recall, and MTTD alongside coverage counts.

## ⚠️ Follow-ups they'll hit you with
- Why is 100% ATT&CK coverage a bad goal?
- Coverage versus confidence — what's the difference?

## 🔗 Related
- [[MITRE ATT&CK]]
- [[IR - SOC Metrics MTTD vs MTTR]]
