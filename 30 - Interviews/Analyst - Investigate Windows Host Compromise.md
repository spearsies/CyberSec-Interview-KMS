---
type: interview-question
question: "How do you investigate a possible compromise on a Windows host?"
domain: [analyst, ir, forensics]
role: [principal-analyst-l3, soc-analyst]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you investigate a possible compromise on a Windows host?

## Question
How do you investigate a possible compromise on a Windows host? What Event IDs and artifacts do you check?

## Quick Answer
Scope and hypothesis first, then triage the host through **process lineage**, **authentication events**, **persistence**, and **lateral movement** — anchored on Sysmon and the Security event log. Determine whether it's isolated or spreading, map to ATT&CK, contain via EDR, and recommend eradication.

## Detailed Answer
**1. Scope first.** What's the alert or hypothesis (EDR detection, SIEM correlation, user report)? Is this one host or a pattern across the fleet?

**2. Process execution & lineage** — the fastest path to "is this bad?"
- **Sysmon Event ID 1** (process creation) — full command line + hashes. Look for anomalous parent→child: `winword.exe → powershell.exe`, `outlook.exe → cmd.exe`, or LOLBins (`rundll32`, `mshta`, `regsvr32`) reaching out to the network.
- **Security 4688** (process creation) — command line if audited.
- **Security 4104** (PowerShell script block logging) — deobfuscated script content; encoded/`-enc` commands are a red flag.
- **Sysmon 3** (network connection), **Sysmon 7** (image/DLL load — sideloading), **Sysmon 8** (CreateRemoteThread — injection), **Sysmon 11** (file create), **Sysmon 22** (DNS query).

**3. Authentication & privilege**
- **4624** successful logon — check **Logon Type**: 3 = network, 10 = RDP, 5 = service, 2 = interactive. Type 3/10 from an odd source hints at lateral movement.
- **4625** failed logon — brute force / password spray (many accounts, one source).
- **4672** special privileges assigned — admin-equivalent logon.
- **4720 / 4728 / 4732** — new account, added to admins/privileged groups (persistence).

**4. Persistence**
- **7045** service install, **4697** service installed, **4698** scheduled task created.
- Run/RunOnce keys, Startup folder, WMI event subscriptions, scheduled tasks.

**5. Lateral movement**
- PsExec footprint (`PSEXESVC` service, 7045), WMI/WinRM execution, RDP (Type 10), and 4624 Type 3 chains across hosts.

**6. Collect & preserve.** If warranted: memory image, then Prefetch, ShimCache/AmCache, MFT, registry hives, and the event logs. **Isolate the host via EDR** to contain while preserving evidence.

**7. Conclude.** Map the chain to MITRE ATT&CK, define blast radius (accounts/hosts touched), and hand the customer a clear timeline + containment/eradication recommendation.

## Interview Delivery Tip (L3)
Name the Event IDs confidently but don't just recite them — tie each to *what an attacker is doing* (4625 = spray, 4104 = obfuscated execution, 7045 = persistence). Interviewers at this level are testing whether you think in adversary behaviors, not lists. Bonus: mention you'd turn a novel finding into a detection so it's caught automatically next time.

## MITRE ATT&CK touchpoints
Execution (T1059.001 PowerShell), Persistence (T1543.003 Service, T1053.005 Scheduled Task, T1547 Run Keys), Priv-Esc/Valid Accounts (T1078), Lateral Movement (T1021 Remote Services, T1570), Defense Evasion (T1027 obfuscation, T1055 injection).

## 🔗 Related
- [[Sysmon]]
- [[Windows Security Event IDs]]
