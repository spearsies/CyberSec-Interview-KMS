---
type: interview-question
question: "How do you test a detection before deploying it?"
domain: [engineering, analyst]
role: [soc-analyst, principal-analyst-l3, security-engineer]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you test a detection before deploying it?

## ✅ Quick Answer
Test with known-good and known-bad data. Unit-test the rule logic against sample events — a positive case where it *should* fire and negative cases of benign look-alikes where it shouldn't — then validate end-to-end by executing the technique (e.g. Atomic Red Team) in a lab and confirming the alert. Automate all of it in CI so every change is tested.

## 🗣️ Talking points
- Positive and negative test cases baked into the repo.
- Data-driven tests: replay captured logs through the rule.
- Live validation: Atomic Red Team / adversary emulation in a test range.
- CI gate blocks a merge if tests fail.
- Regression-test against known true positives so tuning doesn't blind you.
- Measure precision/recall before it hits production.

## ⚠️ Follow-ups they'll hit you with
- How do you test without triggering production alerts?
- How do you build a good negative (benign) test set?

## 🔗 Related
- [[DetectionEng - Continuous Validation and Purple Teaming]]
- [[Analyst - Tuning a Noisy Detection Rule]]
