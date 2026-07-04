---
type: interview-question
question: "What is defense in depth and how does it apply in a SOC?"
domain: [analyst, engineering]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What is defense in depth and how does it apply in a SOC?

## ✅ Quick Answer
Defense in depth layers independent controls so no single failure is fatal — perimeter, network, endpoint, identity, application, and data controls, plus detection and response. For a SOC it also means layered **visibility**: overlapping telemetry so an attacker who evades one layer is still caught by another.

## 🗣️ Talking points
- Prevent / detect / respond controls at each layer.
- "Assume breach" — layers buy detection and response time.
- Overlapping detection sources reduce blind spots (email filter + EDR + proxy + DLP all get a shot at a phish).
- Contrast with Zero Trust (perimeter-less, verify every request).
- Redundancy is deliberate, not waste.

## ⚠️ Follow-ups they'll hit you with
- How is this different from Zero Trust?
- Where do detective controls fit versus preventive ones?

## 🔗 Related
- [[Analyst - Access Control Models]]
- [[Cloud - Threat Detection in Cloud vs On-Prem]]
