---
type: interview-question
question: "Explain Kerberoasting and how you'd detect it."
domain: [analyst, ir]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Explain Kerberoasting and how you'd detect it.

## ✅ Quick Answer
Kerberoasting abuses Kerberos: any authenticated user can request a service ticket (TGS) for an account that has an SPN, then crack that ticket **offline** to recover the service account's password — no elevated access needed up front. Detect it via a spike in TGS requests (Event **4769**), especially weak **RC4** tickets (encryption type 0x17), from a single account against many different SPNs.

## 🗣️ Talking points
- Service accounts often have weak, non-expiring passwords and elevated rights → high-value targets.
- Attackers force RC4 (0x17) because those tickets crack faster offline than AES.
- Detection signals: 4769 volume/anomaly per user, RC4 requests where AES is expected, one account requesting many distinct service names in a short window.
- Mitigations: long (25+ char) or group-managed service account (gMSA) passwords, disable RC4, and honeypot SPN accounts as tripwires.

## ⚠️ Follow-ups they'll hit you with
- How is this different from AS-REP roasting?
- Why does offline cracking make this so dangerous?

## 🔗 Related
- [[ThreatHunt - Detecting Lateral Movement]]
- [[Analyst - Windows Failed Login Investigation]]
