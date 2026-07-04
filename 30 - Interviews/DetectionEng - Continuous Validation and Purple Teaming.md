---
type: interview-question
question: "How do you make sure your detections still work over time?"
domain: [engineering, threat-hunting, analyst]
role: [principal-analyst-l3, security-engineer]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you make sure your detections still work over time?

## ✅ Quick Answer
Detections rot silently — a log source breaks, an EDR update changes the telemetry — so you validate continuously by executing the techniques your rules should catch and confirming they fire. Atomic Red Team gives quick per-technique tests, breach-and-attack-simulation (BAS) platforms run this continuously, and purple-team exercises pair red execution with blue tuning in real time.

## 🗣️ Talking points
- Causes of detection decay: log outages, schema/telemetry changes, evasion, deprecation.
- Atomic Red Team: scripted, per-technique validation.
- BAS platforms: continuous, automated technique execution.
- Purple teaming: collaborative red+blue, tune detections live.
- Adversary emulation reproduces a specific actor's TTP chain.
- Feed every gap back into the detection lifecycle.

## ⚠️ Follow-ups they'll hit you with
- How would you know a detection silently stopped working?
- Atomic Red Team versus a full red-team engagement?

## 🔗 Related
- [[DetectionEng - Testing Detections Before Deployment]]
- [[ThreatHunt - Threat Hunting Methodology]]
