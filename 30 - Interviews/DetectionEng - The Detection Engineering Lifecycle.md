---
type: interview-question
question: "Walk me through the detection engineering lifecycle."
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

# ❓ Walk me through the detection engineering lifecycle.

## ✅ Quick Answer
It's a repeatable loop: (1) intake a requirement — threat intel, an ATT&CK gap, or an IR finding; (2) research the behavior and confirm the data source exists; (3) develop the rule; (4) test (unit + validation); (5) deploy in stages; (6) tune and monitor; (7) retire when it's obsolete. Feedback from incidents and false positives feeds the next turn of the loop.

## 🗣️ Talking points
- Requirement sources: intel, ATT&CK coverage gaps, hunt/IR findings.
- Research the behavior *and* verify you have the telemetry to see it.
- Develop, then test with positive/negative cases.
- Staged deploy (test workspace → canary → prod).
- Operate: monitor precision, tune, document.
- Deprecate obsolete or permanently noisy rules — with ownership throughout.

## ⚠️ Follow-ups they'll hit you with
- Where do detection ideas come from?
- When do you retire a detection instead of tuning it?

## 🔗 Related
- [[DetectionEng - Managing Detection Rule Lifecycle]]
- [[Analyst - Building a Threat Hunt Hypothesis]]
