---
type: interview-question
question: "What is the difference between an IDS and an IPS?"
domain: [analyst, networking]
role: [soc-analyst]
difficulty: easy
status: mastered
confidence: 5
last_reviewed: 2026-07-03
tags:
  - review
  - interview-question
---

# ❓ What is the difference between an IDS and an IPS?

## ✅ Quick Answer
An **IDS** detects and alerts on suspicious traffic but sits out-of-band — it doesn't stop anything. An **IPS** sits inline and can actively block or drop malicious traffic. IDS = visibility; IPS = enforcement.

## 🗣️ Talking points
- Trade-off: an inline IPS can break legitimate traffic on a false positive, so tuning matters more.
- Detection methods (signature vs. anomaly/behavioral) apply to both.

## 🔗 Related
- [[Networking - 3-Way Handshake]]
