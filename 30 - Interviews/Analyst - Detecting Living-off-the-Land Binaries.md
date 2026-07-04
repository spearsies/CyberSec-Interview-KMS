---
type: interview-question
question: "What are LOLBins and how do you detect their abuse?"
domain: [analyst, malware, threat-hunting]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What are LOLBins and how do you detect their abuse?

## ✅ Quick Answer
LOLBins are legitimate, signed OS binaries — certutil, rundll32, mshta, regsvr32, wmic, bitsadmin, PowerShell — that attackers abuse to download, execute, or hide payloads. They blend in because the binary itself is trusted. You detect the abuse through **behavior and context**: suspicious command-line arguments, unusual parent-child process chains, and network activity from binaries that have no business making connections.

## 🗣️ Talking points
- Examples: `certutil -urlcache` (download), `regsvr32` scriptlet (AppLocker bypass), `mshta` remote HTA, `rundll32` exported-function abuse.
- Detection: command-line auditing (4688 with cmdline, or Sysmon 1), parent-child anomalies (winword.exe → powershell.exe), egress from a LOLBin, encoded/obfuscated arguments.
- Reference the LOLBAS project for known abusable binaries and their signatures.
- Mitigation: application control (WDAC/AppLocker), PowerShell constrained language mode, and blocking or heavily monitoring the riskiest binaries.

## ⚠️ Follow-ups they'll hit you with
- Why can't you just block these binaries outright?
- How would Office spawning PowerShell look in your telemetry?

## 🔗 Related
- [[Analyst - Triage a Suspicious PowerShell Alert]]
- [[ThreatHunt - Detecting Lateral Movement]]
- [[LOLBins]]
