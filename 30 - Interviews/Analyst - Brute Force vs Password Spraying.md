---
type: interview-question
question: "What's the difference between brute forcing and password spraying, and how do you detect each?"
domain: [analyst]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What's the difference between brute forcing and password spraying, and how do you detect each?

## ✅ Quick Answer
Brute force hammers **one account** with many passwords (noisy, trips lockouts). Password spraying tries **one common password across many accounts** (low-and-slow, evades lockout). Detect brute force by failures per account/source; detect spraying by one source failing against many *distinct* accounts (`dcount` of accounts) over a window.

## 🗣️ Talking points
- 4625 volume per account (brute) versus per source across many accounts (spray).
- Lockout policy is exactly why attackers prefer spraying.
- Low-and-slow spray needs a wide detection window to surface.
- A successful logon right after a burst of failures = likely compromise.
- Mitigations: MFA, lockout thresholds, conditional access, banned-password lists.

## ⚠️ Follow-ups they'll hit you with
- How do you catch low-and-slow spraying?
- Why doesn't MFA fully solve this? (MFA fatigue / push bombing)

## 🔗 Related
- [[KQL - Detecting Brute Force with KQL]]
- [[Analyst - Windows Failed Login Investigation]]
