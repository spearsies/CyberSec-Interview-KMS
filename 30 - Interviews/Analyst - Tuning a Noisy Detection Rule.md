---
type: interview-question
question: "How do you tune a noisy detection rule without missing true positives?"
domain: [analyst, engineering]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you tune a noisy detection rule without missing true positives?

## ✅ Quick Answer
Start from data, not intuition. Measure the rule's current true-positive vs false-positive rate, understand *why* it fires (which field values dominate the benign hits), then narrow with **context** — asset criticality, user role, baseline behavior — rather than blanket suppression or a higher threshold. Prefer allow-listing known-good over broadening the logic, and re-validate against historical true positives so you don't tune away real detections.

## 🎯 Why they ask it
- Alert fatigue is the #1 operational problem in a SOC. They want to see you balance precision and recall like an engineer, not just mute the alert.

## 🗣️ Talking points
- Pull 30–90 days of hits and cluster by the noisy dimension (host, user, process, parent process) to see what's actually generating volume.
- Separate *benign-true* (legitimate admin activity) from *benign-false* (bad rule logic) — they get fixed differently.
- Add enrichment/context (is this a privileged account? a crown-jewel host?) instead of raising thresholds blindly.
- Use a documented exception list with an expiry date, not a permanent silence.
- Re-test the tuned rule against known true-positive samples or purple-team data before shipping.
- Track precision, recall, and alert volume before/after so the change is measurable.

## ⚠️ Follow-ups they'll hit you with
- How do you stop an attacker from simply hiding inside your allow-list?
- How would you prove a tuning change was *safe* and didn't blind you?

## 🔗 Related
- [[Analyst - What Makes a Good Detection Rule]]
- [[Analyst - Prioritizing a Flood of Alerts]]
