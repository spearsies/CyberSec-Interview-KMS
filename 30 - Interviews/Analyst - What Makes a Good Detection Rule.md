---
type: interview-question
question: "What makes a good detection, and how do you measure detection quality?"
domain: [engineering, analyst]
role: [soc-analyst, principal-analyst-l3, security-engineer]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What makes a good detection, and how do you measure detection quality?

## ✅ Quick Answer
A good detection targets attacker *behavior* (hard for them to change) over brittle IOCs (trivial to change), fires with high precision, carries the context an analyst needs to triage fast, and is tested and documented. Quality is measured — precision (few false positives), recall/coverage, time-to-detect, and resilience to evasion — not guessed at.

## 🎯 Why they ask it
- Senior analysts increasingly own detection engineering. They want to know you can build detections that survive contact with real adversaries and real analysts.

## 🗣️ Talking points
- Pyramid of Pain: hashes and IPs are cheap for the adversary to rotate; TTPs are painful — build up the pyramid.
- Robust logic + enrichment + explicit triage steps embedded in the alert.
- Every rule needs a test (a unit test or an atomic red-team action) before and after deployment.
- KPIs: precision, recall, MTTD, false-positive rate — tracked over time.
- Treat detections as code: version control, peer review, CI validation (detection-as-code).
- Watch for evasion and assumption drift — a rule that was precise last quarter may rot.

## ⚠️ Follow-ups they'll hit you with
- How would you test a detection *before* it goes to production?
- Explain the Pyramid of Pain.

## 🔗 Related
- [[Analyst - Tuning a Noisy Detection Rule]]
- [[Analyst - Using MITRE ATT&CK in SOC Operations]]
