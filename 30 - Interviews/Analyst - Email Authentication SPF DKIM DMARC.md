---
type: interview-question
question: "Explain SPF, DKIM, and DMARC and how they help detect spoofed email."
domain: [analyst, ir]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Explain SPF, DKIM, and DMARC and how they help detect spoofed email.

## ✅ Quick Answer
They're layered email-authentication checks. **SPF** authorizes which servers may send for a domain (envelope check). **DKIM** cryptographically signs the message so tampering or forgery is detectable. **DMARC** ties SPF/DKIM results to the visible From domain (alignment), tells receivers what to do on failure (none / quarantine / reject), and provides reporting. Together they make domain spoofing much harder.

## 🗣️ Talking points
- SPF = sender-IP authorization via DNS TXT; breaks on plain forwarding.
- DKIM = signature + public key in DNS; survives forwarding.
- DMARC = alignment + policy + aggregate/forensic reports; `p=reject` is the goal.
- Failures and soft-fails are strong phishing signals.
- During triage, read the `Authentication-Results` header.

## ⚠️ Follow-ups they'll hit you with
- Why can an email pass SPF and still be phishing? (cousin domains, alignment)
- What does DMARC alignment actually mean?

## 🔗 Related
- [[Analyst - Email Header and Phishing Analysis]]
- [[Analyst - Investigate a Suspicious Email Alert]]
