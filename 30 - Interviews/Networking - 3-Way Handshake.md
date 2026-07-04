---
type: interview-question
question: "Describe the TCP 3-way handshake."
domain: [networking]
role: [soc-analyst]
difficulty: easy
status: reviewing
confidence: 3
last_reviewed: 2026-07-03
tags:
  - review
  - interview-question
---

# ❓ Describe the TCP 3-way handshake.

## ✅ Quick Answer
It's how two hosts establish a reliable connection: **SYN → SYN-ACK → ACK**. The client sends a SYN (seq=x), the server replies SYN-ACK (seq=y, ack=x+1), and the client sends ACK (ack=y+1). Sequence numbers are now synced and data can flow.

## 🎯 Why they ask it
- Baseline check that you understand connection-oriented transport before deeper packet/IR questions.

## 🗣️ Talking points
- Contrast with UDP (connectionless, no handshake).
- Where it shows up in security: incomplete handshakes (SYN → SYN-ACK → RST) signal scanning; a flood of un-ACK'd SYNs signals a SYN-flood DoS.

## ⚠️ Follow-ups they'll hit you with
- How would you spot a port scan vs. a SYN flood in a capture?

## 🔗 Related
- [[Networking - Port Scan vs SYN Flood]]
- [[TCP Flags and Control Bits]]
