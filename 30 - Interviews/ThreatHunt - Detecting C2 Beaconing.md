---
type: interview-question
question: "How do you detect command-and-control beaconing in network traffic?"
domain: [networking, threat-hunting]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you detect command-and-control beaconing in network traffic?

## ✅ Quick Answer
Beacons phone home on a regular cadence, so the tell is **regularity**, not payload. Hunt for periodic connections (a fixed interval ± jitter) to the same destination, consistent small request sizes, long-lived low-volume sessions, and traffic to newly-seen or low-reputation domains. Inter-arrival / interval analysis over proxy or NetFlow logs surfaces beacons even when the payload is HTTPS-encrypted.

## 🗣️ Talking points
- Analyze inter-arrival times per source→destination pair; low variance = periodicity = suspicious.
- Account for jitter — mature malware randomizes the interval by ±% to defeat naive timing detection.
- Fingerprint the client with JA3/JA4 and user-agent to spot malware TLS stacks.
- Byte-count consistency (heartbeat packets) and sleep patterns that align to work hours.
- Tools: RITA, Zeek/Corelight for connection metadata.
- False positives: software update checks and telemetry are also periodic — baseline and allow-list them.

## ⚠️ Follow-ups they'll hit you with
- How does jitter complicate interval detection?
- You can't decrypt the TLS — what can you still use? (JA3/JA4, SNI, timing, certificate)

## 🔗 Related
- [[ThreatHunt - Detecting DNS Tunneling and C2]]
- [[Networking - Port Scan vs SYN Flood]]
