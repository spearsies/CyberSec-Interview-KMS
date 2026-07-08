---
type: interview-question
question: "How do you investigate an EDR detection — what telemetry do you pull and in what order?"
domain: [analyst, ir, forensics]
role: [soc-analyst, principal-analyst-l3, dfir]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you investigate an EDR detection — what telemetry do you pull, and in what order?

## ✅ Quick Answer
Start at the detection and work outward through **process lineage → command line + hashes → network → persistence → spread**. EDR gives you the full process/file/registry/network timeline on the host; I use it to decide TP vs FP, scope the blast radius, then contain (isolate host, kill process, quarantine) — all mapped to ATT&CK.

## 🗣️ Walk-through
- **Anchor on the alert**, then pull the **process tree** — parent-child anomalies are the fastest tell (Office spawning PowerShell, `services.exe` spawning cmd, LOLBins in odd chains).
- **Command line + hashes** — decode encoded PowerShell; check hash reputation; unsigned binaries from `%TEMP%`/`%APPDATA%`.
- **Network connections** — outbound C2, odd ports, beaconing.
- **Persistence** — scheduled tasks, services, run keys, WMI subscriptions.
- **File/registry writes** — dropped payloads, staged archives.
- **Pivot the IOC across the fleet** — does this hash/domain exist on other hosts? That's your scope.

## 🛠️ Response actions from the console
Network-contain the host, kill/quarantine the process, and use live-response (e.g., CrowdStrike **RTR**, Defender live response) to collect artifacts or remediate.

## 🧠 Senior signals
- Distinguish **LOLBin abuse from legitimate admin** by context (user, timing, parent).
- Know EDR **blind spots**: unmanaged devices, in-memory-only activity, and evasion like unhooking/BYOVD — so you corroborate with network + identity telemetry, not EDR alone.

## 🔗 Related
- [[SIEM - Log Analysis End to End]]
- [[Analyst - Investigate Windows Host Compromise]]
