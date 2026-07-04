---
type: interview-question
question: "How would you detect data exfiltration?"
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

# ❓ How would you detect data exfiltration?

## ✅ Quick Answer
Exfil detection is about spotting abnormal **outbound** data movement and the staging that precedes it. Baseline normal egress per user and host, then flag volume spikes, large transfers to cloud storage or personal accounts, unusual destinations, and off-hours activity — plus staging behavior (mass file access, compression) that comes first. Cover multiple channels: web, DNS, email, USB, and cloud.

## 🗣️ Talking points
- Signals: outbound byte-volume anomalies, uploads to file-sharing/personal cloud, DNS/ICMP tunneling, external email with large attachments, USB mass copy, database dumps.
- Staging precursors: bulk reads, archive creation (7-Zip/RAR), sudden access to file shares.
- Data sources: proxy, DLP, NetFlow, CASB, EDR file events.
- Baseline and peer-group analysis cut false positives (what's normal for *this* role?).
- Insider vs external changes the signal — insiders use legitimate access, so behavior deviation matters more than a bad reputation.

## ⚠️ Follow-ups they'll hit you with
- How would encrypted (HTTPS) exfil change your approach?
- Insider versus external exfil — what differs in the telemetry?

## 🔗 Related
- [[ThreatHunt - Detecting DNS Tunneling and C2]]
- [[Cloud - Threat Detection in Cloud vs On-Prem]]
