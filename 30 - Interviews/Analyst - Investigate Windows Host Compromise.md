---
type: interview-question
question: "How do you investigate a possible compromise on a Windows host?"
domain: [analyst, ir, forensics]
role: [soc-analyst, principal-analyst-l3, dfir]
difficulty: hard
status: to-study
confidence: 2
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you investigate a possible compromise on a Windows host?

## ✅ Quick Answer
Scope and hypothesis first, then work **process lineage → auth events → persistence → lateral movement**, anchored on Sysmon and the Security log. Determine if it's isolated or spreading, map to ATT&CK, contain via EDR, recommend eradication.

## 🗣️ Talking points
- Sysmon 1 (process + cmdline/hash), 3 (netconn), 8 (CreateRemoteThread/injection), 11 (file), 22 (DNS).
- Security 4624/4625 (logon type — 3 network, 10 RDP), 4688, 4104 (PowerShell script block), 7045 (service install), 4720/4732 (account/group changes).
- Tie each Event ID to attacker behavior, not a recited list.

## ⚠️ Follow-ups they'll hit you with
- Now do the same investigation on a Linux host.

## 🔗 Related
- [[Analyst - IDS vs IPS]]
