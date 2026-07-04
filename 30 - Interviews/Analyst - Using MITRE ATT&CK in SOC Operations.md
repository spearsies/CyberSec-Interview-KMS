---
type: interview-question
question: "How do you use MITRE ATT&CK day to day in the SOC?"
domain: [analyst, threat-hunting]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you use MITRE ATT&CK day to day in the SOC?

## ✅ Quick Answer
ATT&CK is a common language and a coverage map. Day to day I map detections and investigations to techniques so I can describe attacker behavior precisely, spot detection gaps with a coverage heatmap, prioritize based on the techniques real adversaries use against my sector, and structure investigations across tactics (initial access → … → impact) instead of chasing isolated alerts.

## 🎯 Why they ask it
- It shows you think in behaviors/TTPs and can communicate and prioritize using a shared framework the whole team understands.

## 🗣️ Talking points
- Tag alerts and detections with technique IDs so investigations speak a common language.
- Build a coverage heatmap in ATT&CK Navigator to expose blind spots.
- Combine threat intel + ATT&CK to prioritize: what does the actor targeting *us* actually use?
- During IR, chain techniques to anticipate the adversary's likely next move.
- Caveats: it isn't exhaustive, don't chase 100% coverage, and weight techniques by likelihood and impact.

## ⚠️ Follow-ups they'll hit you with
- How do you decide which techniques to build detections for first?
- How is ATT&CK different from the Cyber Kill Chain?

## 🔗 Related
- [[Analyst - What Makes a Good Detection Rule]]
- [[ThreatIntel - Operationalizing Threat Intelligence]]
- [[MITRE ATT&CK]]
- [[Cyber Kill Chain]]
