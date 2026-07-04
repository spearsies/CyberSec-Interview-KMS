---
type: interview-question
question: "How do you safely analyze a suspected malicious attachment?"
domain: [analyst, malware, ir]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you safely analyze a suspected malicious attachment?

## ✅ Quick Answer
Never open it on your workstation. Work in an isolated sandbox/VM with no corporate network. Start with **static** analysis (hashes, file type, strings, macros via oletools, reputation lookups), then **dynamic** detonation to watch process, file, registry, and network behavior. Extract IOCs, map to ATT&CK, and preserve the sample.

## 🗣️ Talking points
- Isolation first: offline VM or a sandbox (Any.Run, Joe Sandbox, Cuckoo).
- Static: hash, magic bytes, `oleid`/`olevba` for Office macros, `strings`, PE headers.
- Be careful uploading to VirusTotal — it can tip off the attacker or leak sensitive data.
- Dynamic: procmon + packet capture; note C2 callbacks and dropped files.
- Extract IOCs, map behavior to ATT&CK, keep chain of custody on the sample.

## ⚠️ Follow-ups they'll hit you with
- Why is uploading to VirusTotal sometimes risky?
- Static versus dynamic analysis — when do you use each?

## 🔗 Related
- [[Analyst - Triage a Suspicious PowerShell Alert]]
- [[Analyst - Pivoting on Indicators of Compromise]]
