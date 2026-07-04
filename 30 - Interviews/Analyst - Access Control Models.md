---
type: interview-question
question: "Compare the main access control models (DAC, MAC, RBAC, ABAC)."
domain: [analyst, engineering]
role: [soc-analyst, security-engineer]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Compare the main access control models (DAC, MAC, RBAC, ABAC).

## ✅ Quick Answer
Access control decides who can do what. **DAC** lets the resource owner grant access (flexible but weak — Windows ACLs). **MAC** enforces system-wide labels/clearances (rigid, high-security — SELinux). **RBAC** grants by job role (scalable, the enterprise default). **ABAC** decides on attributes and context — user, resource, environment — for fine-grained, dynamic policy. Least privilege underpins all four.

## 🗣️ Talking points
- DAC: owner-driven, discretionary — easy to misconfigure.
- MAC: mandatory labels/clearances — government/military, non-negotiable.
- RBAC: role → permission mapping — easy to audit, most common enterprise choice.
- ABAC: policy on attributes (dept, time, device, location) — powers Zero Trust.
- Principles that cut across all: least privilege and separation of duties.
- RBAC vs ABAC is a simplicity-vs-granularity trade-off.

## ⚠️ Follow-ups they'll hit you with
- When would you choose ABAC over RBAC?
- How does this map to Zero Trust?

## 🔗 Related
- [[Analyst - CIA Triad]]
- [[Analyst - Defense in Depth]]
- [[Zero Trust]]
