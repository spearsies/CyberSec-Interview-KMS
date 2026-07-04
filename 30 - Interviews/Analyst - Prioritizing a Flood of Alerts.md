---
type: interview-question
question: "You have 200 alerts and limited time. How do you prioritize and work them?"
domain: [analyst]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ You have 200 alerts and limited time. How do you prioritize and work them?

## ✅ Quick Answer
Triage by **risk, not queue order**. Prioritize on asset criticality × credibility × potential impact — crown-jewel systems, privileged accounts, and high-fidelity detections first. Group related alerts (they're often one incident), clear the quick high-confidence verdicts, and escalate anything touching sensitive assets early. Then feed the noise back into tuning so 200 becomes 20.

## 🎯 Why they ask it
- SOC reality is more alerts than hours. They want to see judgment, not heroics — and a systemic instinct to fix the flood, not just bail water.

## 🗣️ Talking points
- Risk = likelihood × impact; weight by asset value and account privilege.
- Correlate/cluster alerts by shared host, user, or campaign to avoid duplicated work.
- Detection fidelity matters — known high-precision rules jump the queue.
- Timebox each investigation; escalate or close with documented rationale.
- Systemic fixes: tune noisy rules, automate enrichment (SOAR), adopt risk-based alerting.
- Don't tunnel on one alert while a worse one waits.

## ⚠️ Follow-ups they'll hit you with
- How do you decide what to automate?
- How do you avoid burnout and missed true positives under this pressure?

## 🔗 Related
- [[Analyst - Tuning a Noisy Detection Rule]]
- [[Behavioral - Security Incident Under Pressure]]
