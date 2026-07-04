---
type: interview-question
question: "When and how would you use memory forensics in an investigation?"
domain: [forensics, ir, malware]
role: [principal-analyst-l3, dfir]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ When and how would you use memory forensics in an investigation?

## ✅ Quick Answer
Reach for memory when the evidence only lives in RAM — fileless/in-memory malware, injected code, decrypted payloads, active network connections, and credentials or keys that never touch disk. Capture volatile memory **before** powering off (order of volatility), then analyze the image with Volatility to reconstruct processes, injected regions, and network state.

## 🗣️ Talking points
- Order of volatility: RAM before disk — pulling the plug destroys it.
- Capture tools: WinPMEM, DumpIt (Windows), LiME (Linux).
- Volatility3 plugins: `pslist`/`psscan` (hidden processes), `malfind` (injection), `netscan` (connections), `cmdline`, `dlllist`, `handles`.
- Surfaces process hollowing, reflective DLL injection, Cobalt Strike beacons, and in-memory credentials (Mimikatz).
- Caveat: acquisition itself changes state and can "smear" on a live system — document your method.
- When *not* to: if disk artifacts already answer the question, or uptime must be preserved.

## ⚠️ Follow-ups they'll hit you with
- What does process injection look like in a memory image?
- What are the risks of acquiring memory from a live production host?

## 🔗 Related
- [[Analyst - Investigate Windows Host Compromise]]
- [[IR - NIST Incident Response Lifecycle]]
