---
type: interview-question
question: "Walk me through the NIST 800-61 incident response lifecycle."
domain: [ir, analyst]
role: [soc-analyst, principal-analyst-l3, dfir]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Walk me through the NIST 800-61 incident response lifecycle.

## ✅ Quick Answer
Classic **Rev 2 (2012)** is a four-phase loop: **Preparation → Detection & Analysis → Containment, Eradication & Recovery → Post-Incident Activity**, iterating between detection and containment as scope grows. As of **Rev 3 (April 2025)**, NIST retired that rigid model and re-mapped IR onto **CSF 2.0's six functions** — Govern/Identify/Protect (preparation) and Detect/Respond/Recover (handling), with Improvement feeding lessons learned back into all of them.

## 🎯 Why they ask it
- Baseline framework literacy — and a quiet test of whether you're current or stuck on the 2012 doc.

## 🗣️ Talking points
- **Rev 2 phases (still the operational mental model):**
  - *Preparation* — tooling, playbooks, logging, IR plan, comms trees.
  - *Detection & Analysis* — validate, scope, prioritize by impact, document.
  - *Containment, Eradication & Recovery* — short-term vs long-term containment; remove foothold; restore from known-good.
  - *Post-Incident Activity* — lessons learned, root cause, detection improvements.
- **Rev 3 (current):** CSF 2.0 Community Profile; supersedes Rev 2. Treats IR as part of ongoing risk management, not a bounded event. Containment/eradication → **Respond**; restoration → **Recover**; continuous improvement is explicit.
- **Why NIST changed it:** IR practice changes too fast to freeze in a static doc, so Rev 3 points to living online resources instead.

## ⚠️ Follow-ups they'll hit you with
- "Which do you actually use day to day?" → the four phases for hands-on work; CSF mapping for program/reporting.
- "Difference between short-term and long-term containment?" → stop-the-bleeding now vs. temporary fixes that keep the business running while you rebuild.

## 🔗 Related
- [[IR - Ransomware Containment & Eradication (Client System)]]
