---
type: interview-question
question: "How do you operationalize threat intelligence in a SOC?"
domain: [threat-hunting, analyst]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you operationalize threat intelligence in a SOC?

## ✅ Quick Answer
Intel is only useful if it drives action. Operationalizing it means turning relevant, prioritized intel into detections, hunts, and blocking — matched to your threat model — and closing the loop by feeding your own incident findings back out as intel. Tactical IOCs feed detection and blocking; strategic intel on actor TTPs shapes your hunts and roadmap.

## 🗣️ Talking points
- Levels: strategic (who/why), operational (campaigns), tactical (IOCs/TTPs).
- Relevance first — intel about actors actually targeting your sector beats a firehose of generic feeds.
- IOC lifecycle: ingest → enrich → match against logs → alert/block → **expire** (IOCs decay fast).
- Turn TTP intel into ATT&CK-mapped detections and hunt hypotheses.
- Platforms: MISP / a TIP to manage and score feeds.
- Beware low-quality feeds — they manufacture false-positive noise. Close the loop: your incidents produce new intel.

## ⚠️ Follow-ups they'll hit you with
- Why do IOCs "decay," and how do you handle it?
- How do you avoid drowning in low-quality feeds?

## 🔗 Related
- [[Analyst - Using MITRE ATT&CK in SOC Operations]]
- [[ThreatHunt - Threat Hunting Methodology]]
