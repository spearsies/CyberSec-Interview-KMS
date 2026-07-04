---
type: interview-question
question: "What is detection-as-code and why adopt it?"
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

# ❓ What is detection-as-code and why adopt it?

## ✅ Quick Answer
Detection-as-code treats detections like software: rules live in version control, go through peer review via pull requests, are tested automatically, and deploy through CI/CD — instead of being hand-edited in a SIEM console. You get history, rollback, collaboration, testing, and consistency.

## 🗣️ Talking points
- Rules stored as code (Sigma / YAML / native query) in Git — one source of truth.
- Peer review via pull requests catches bad logic before production.
- Automated tests run in CI on every change.
- Staged deployment with rollback instead of live console edits.
- Coverage and quality metrics tracked over time.
- It's a culture shift from console-clicking to engineering discipline.

## ⚠️ Follow-ups they'll hit you with
- What are the benefits over editing rules directly in the SIEM console?
- What lives in the repo besides the rules? (tests, docs, pipeline config, exceptions)

## 🔗 Related
- [[DetectionEng - CI-CD Pipelines for Detections]]
- [[DetectionEng - Writing Portable Rules with Sigma]]
- [[Analyst - What Makes a Good Detection Rule]]
