---
type: interview-question
question: "Your EDR flags an encoded PowerShell command. Walk me through triage."
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

# ❓ Your EDR flags an encoded PowerShell command. Walk me through triage.

## ✅ Quick Answer
Decode first, then judge intent and blast radius. Base64-decode the `-EncodedCommand`, look at what it actually does (download cradle, `IEX`, reverse shell), check the parent process (Office or a browser = bad), the user and host context, and whether it executed or was blocked. Then decide contain-or-monitor based on impact and confidence, and pivot to whatever ran next.

## 🗣️ Talking points
- Deobfuscate `-enc` / `-e` payloads; watch for `IEX`, `DownloadString`, `FromBase64String`, and hidden/`-nop` flags.
- Parent-child lineage (4688 / Sysmon 1) — winword.exe → powershell.exe is a classic macro-execution red flag.
- Script-block logging (Event **4104**) reveals the real, deobfuscated script.
- Check network connections (Sysmon 3), file writes, follow-on processes, and any persistence created.
- Scope it: one host or many? Contain via EDR isolation if confirmed, and preserve evidence.

## ⚠️ Follow-ups they'll hit you with
- The command is heavily obfuscated — how do you get to the real intent? (4104 script-block logs, a sandbox)
- When do you isolate the host versus keep watching?

## 🔗 Related
- [[Analyst - Detecting Living-off-the-Land Binaries]]
- [[Analyst - Investigate Windows Host Compromise]]
- [[LOLBins]]
- [[Sysmon]]
