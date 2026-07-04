---
type: interview-question
question: "How do you manage detection rule lifecycle and avoid rule rot?"
domain: [engineering, analyst]
role: [soc-analyst, principal-analyst-l3, security-engineer]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you manage detection rule lifecycle and avoid rule rot?

## ✅ Quick Answer
Every rule needs an owner, metadata, a review cadence, and an exit. Avoid "rule rot" by recording why each rule exists (ATT&CK reference, author, date), reviewing its FP/TP performance regularly, expiring exceptions, and deprecating rules that are redundant, permanently noisy, or obsolete. Detections are living code, not fire-and-forget.

## 🗣️ Talking points
- Rule metadata and a named owner for every detection.
- Scheduled review of precision and alert volume.
- Exceptions carry expiry dates so allow-lists don't grow forever.
- Deprecate redundant, noisy, or obsolete rules deliberately.
- Git history captures the full change record and rationale.

## ⚠️ Follow-ups they'll hit you with
- When do you retire a rule versus tune it?
- How do you stop exception lists from growing unbounded?

## 🔗 Related
- [[DetectionEng - The Detection Engineering Lifecycle]]
- [[Analyst - Tuning a Noisy Detection Rule]]
