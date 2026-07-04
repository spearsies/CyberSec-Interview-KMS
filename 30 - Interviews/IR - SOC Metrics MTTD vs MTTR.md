---
type: interview-question
question: "What is MTTD versus MTTR, and which SOC metrics actually matter?"
domain: [ir, analyst]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What is MTTD versus MTTR, and which SOC metrics actually matter?

## ✅ Quick Answer
**MTTD** (mean time to detect) is how long a threat goes unnoticed; **MTTR** (mean time to respond/remediate) is how long to contain and resolve after detection. Both should trend down. Beyond them: dwell time, false-positive rate, detection coverage, and escalation accuracy — metrics that reflect real risk reduction, not just ticket volume.

## 🗣️ Talking points
- MTTD/MTTR definitions and why lowering both matters.
- Dwell time = the attacker's total window of opportunity.
- FP rate and alert volume drive analyst fatigue.
- Coverage measured against ATT&CK.
- Beware vanity metrics (tickets closed) — tie metrics to risk and to tuning/automation gains.

## ⚠️ Follow-ups they'll hit you with
- How would you lower MTTD specifically?
- Name a SOC metric that's misleading.

## 🔗 Related
- [[Analyst - Prioritizing a Flood of Alerts]]
- [[Analyst - Tuning a Noisy Detection Rule]]
