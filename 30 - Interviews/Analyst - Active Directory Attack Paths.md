---
type: interview-question
question: "What are common Active Directory attack paths and how do you detect them?"
domain: [analyst, ir, threat-hunting]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What are common Active Directory attack paths and how do you detect them?

## ✅ Quick Answer
Attackers pivot through AD via credential theft and privilege escalation: Kerberoasting / AS-REP roasting for service creds, Pass-the-Hash / Pass-the-Ticket for lateral movement, DCSync to pull hashes, and Golden / Silver Tickets for persistence — usually ending at Domain Admin or the KRBTGT account. Detect via anomalous Kerberos and replication events, and map paths with BloodHound (which both attackers and defenders use).

## 🗣️ Talking points
- Kerberoasting: 4769 with RC4 (0x17) against many SPNs.
- DCSync: 4662 replication requests from a non-domain-controller.
- Pass-the-Hash: NTLM auth anomalies, logons without interactive auth.
- Golden Ticket: KRBTGT-signed TGTs with abnormal lifetimes.
- Privileged group changes: 4728 / 4732.
- Mitigations: tiered admin model, LAPS, gMSA, protected users, KRBTGT rotation.

## ⚠️ Follow-ups they'll hit you with
- What is DCSync and how would you detect it?
- What's a Golden Ticket versus a Silver Ticket?

## 🔗 Related
- [[Analyst - Detecting Kerberoasting]]
- [[ThreatHunt - Detecting Lateral Movement]]
- [[Kerberos Authentication]]
