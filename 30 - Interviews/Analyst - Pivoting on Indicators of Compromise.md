---
type: interview-question
question: "You have one IOC. How do you pivot to find the full scope of an intrusion?"
domain: [analyst, threat-hunting, ir]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ You have one IOC. How do you pivot to find the full scope of an intrusion?

## ✅ Quick Answer
Treat the IOC as a starting node and expand outward. Search all telemetry for it, then pivot on everything it touched — a hash to the hosts and processes that ran it, an IP/domain to the systems that connected, an account to its logons. Enrich with threat intel, iterate until the graph stops growing, and map findings to ATT&CK.

## 🗣️ Talking points
- Pivot types: hash ↔ host/process, domain/IP ↔ connections, account ↔ authentications.
- Enrich via threat intel: WHOIS, passive DNS, VirusTotal relationships.
- Think in the Diamond Model (adversary / infrastructure / capability / victim).
- IOCs decay — pivot toward durable TTPs.
- Scope is reached when new pivots stop yielding; feed results back as detections.

## ⚠️ Follow-ups they'll hit you with
- How do you avoid false-positive pivots on shared/CDN infrastructure?
- IOCs versus IOAs — what's the difference?

## 🔗 Related
- [[ThreatIntel - Operationalizing Threat Intelligence]]
- [[Analyst - Investigate Windows Host Compromise]]
