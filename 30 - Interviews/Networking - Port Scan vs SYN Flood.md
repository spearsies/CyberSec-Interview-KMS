---
type: interview-question
question: "How do you tell a port scan from a SYN flood in a packet capture?"
domain: [networking, analyst]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you tell a port scan from a SYN flood in a packet capture?

## ✅ Quick Answer
Both show lots of SYNs, but **intent and shape differ**. A scan is one source touching *many ports/hosts* with few completed handshakes (SYN→SYN-ACK→RST). A SYN flood is *volumetric*, often spoofed sources against *one port*, with the final ACK never arriving so the server's half-open queue fills.

## 🗣️ Talking points
- Wireshark: `tcp.flags.syn==1 && tcp.flags.ack==0`; check `Statistics → Conversations`.
- Scan = enumeration (few packets, many destinations). Flood = resource exhaustion (massive volume, one target).
- Mitigations: SYN cookies, rate limiting, upstream scrubbing.

## 🔗 Related
- [[Networking - 3-Way Handshake]]
- [[TCP Flags and Control Bits]]
