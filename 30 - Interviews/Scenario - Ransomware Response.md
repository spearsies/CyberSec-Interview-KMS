---
type: interview-question
question: "Scenario: ransomware is detected encrypting a file server. Walk me through your response."
domain: [ir, analyst, malware]
role: [soc-analyst, principal-analyst-l3, dfir]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Scenario: ransomware is detected encrypting a file server. Walk me through your response.

## ✅ Quick Answer
Contain fast to stop the spread — isolate affected hosts and cut the propagation path (SMB, compromised accounts) — while preserving evidence, then identify patient zero and scope, eradicate, and recover from clean backups. **Don't** power the machine off (you lose memory and possible keys), don't pay reflexively, and invoke the IR plan with legal and comms early.

## 🗣️ Talking points
- Isolate via network/EDR containment — not a hard power-off.
- Disable spreading accounts and shares; block the C2/propagation path.
- Identify strain, entry vector (phishing / RDP / vuln), and blast radius.
- Preserve memory — decryption keys or artifacts may be recoverable.
- Check for exfiltration (double extortion is now standard).
- Recover from tested, offline/immutable backups; then lessons: segmentation, MFA, backup hygiene.
- Legal and regulatory notification obligations.

## ⚠️ Follow-ups they'll hit you with
- Why not just power off the infected machine?
- How would you advise leadership on paying the ransom?

## 🔗 Related
- [[IR - NIST Incident Response Lifecycle]]
- [[Analyst - Investigate Windows Host Compromise]]
