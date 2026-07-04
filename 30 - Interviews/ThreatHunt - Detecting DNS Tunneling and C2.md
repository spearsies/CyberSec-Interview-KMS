---
type: interview-question
question: "How can attackers abuse DNS, and how do you detect it?"
domain: [networking, threat-hunting, analyst]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How can attackers abuse DNS, and how do you detect it?

## ✅ Quick Answer
DNS is often unmonitored and allowed outbound, so attackers use it for C2 and exfiltration by encoding data in subdomain labels or TXT records — DNS tunneling. Detect it by hunting anomalies: very long / high-entropy subdomains, high query volume to one parent domain, unusual record types (TXT/NULL), and many unique subdomains under a single domain (DGA-like behavior).

## 🗣️ Talking points
- Tunneling tools: iodine, dnscat2, and the Cobalt Strike DNS beacon.
- Signals: subdomain length and entropy, query frequency, NXDOMAIN rates (a DGA tell), rare TLDs, abnormally low TTLs.
- Baseline normal resolver traffic first; enrich with threat intel and newly-registered-domain feeds.
- Mitigate: force clients through internal resolvers, log and inspect DNS, block known-bad, and rate-limit.

## ⚠️ Follow-ups they'll hit you with
- How would you tell a DGA apart from a CDN that legitimately uses many subdomains?
- What log source actually gives you this DNS visibility?

## 🔗 Related
- [[ThreatHunt - Detecting C2 Beaconing]]
- [[Analyst - Detecting Data Exfiltration]]
