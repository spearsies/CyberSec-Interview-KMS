---
type: interview-question
question: "How do you preserve evidence and maintain chain of custody during IR?"
domain: [ir, forensics]
role: [principal-analyst-l3, dfir]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you preserve evidence and maintain chain of custody during IR?

## ✅ Quick Answer
Preserve evidence in **order of volatility**, work only on verified copies (hash before and after), and document every transfer — who held it, when, and why — so it stays admissible and defensible. Chain of custody is the unbroken, documented trail proving the evidence wasn't altered.

## 🗣️ Talking points
- Order of volatility: RAM → disk → logs → archives.
- Hash (SHA-256) originals and copies to prove integrity.
- Forensic images + write blockers; analyze copies, never the original.
- Contemporaneous handler log with timestamps for each transfer.
- Legal hold and documentation — assume it may end up in court.

## ⚠️ Follow-ups they'll hit you with
- What breaks chain of custody?
- Why hash before *and* after acquisition?

## 🔗 Related
- [[IR - NIST Incident Response Lifecycle]]
- [[Forensics - When to Use Memory Forensics]]
