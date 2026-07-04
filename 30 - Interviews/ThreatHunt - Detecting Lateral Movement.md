---
type: interview-question
question: "How do you detect lateral movement in a Windows environment?"
domain: [analyst, threat-hunting, forensics]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you detect lateral movement in a Windows environment?

## ✅ Quick Answer
Lateral movement shows up as authentication and remote-execution patterns that deviate from normal admin behavior. Watch for remote logons (4624 type 3), new admin-tool usage (PsExec / WMI / WinRM / RDP), remote service creation (7045), and credential-theft precursors. Anchor on the **auth graph** — one account touching many hosts in a short window is the classic signal.

## 🗣️ Talking points
- Key Security events: 4624/4625 (logon types 3 network, 10 RDP), 4648 (explicit credentials), 4672 (privileged logon), 7045 (service install), 5140/5145 (share access).
- Sysmon 1 (process + cmdline) and 3 (network connection) for the execution side.
- Common techniques: PsExec, WMI (`wmic … process call create`), WinRM, remote scheduled tasks, RDP, SMB admin shares.
- Pass-the-Hash / Pass-the-Ticket show up as anomalous NTLM/Kerberos use — logon without a corresponding interactive auth.
- Baseline which accounts *should* reach which hosts; flag deviations.
- Correlate across hosts, not per host — the pattern lives in the aggregate.

## ⚠️ Follow-ups they'll hit you with
- How would Pass-the-Hash look versus a normal logon?
- How would you detect PsExec specifically?

## 🔗 Related
- [[Analyst - Detecting Kerberoasting]]
- [[Analyst - Investigate Windows Host Compromise]]
