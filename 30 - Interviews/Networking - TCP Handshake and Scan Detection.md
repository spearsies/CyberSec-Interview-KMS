---
type: interview-question
question: "Explain the TCP three-way handshake and how you'd spot a scan or SYN flood in a capture."
domain: [networking, analyst]
role: [principal-analyst-l3, soc-analyst]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Explain the TCP three-way handshake and how you'd spot a scan or SYN flood in a capture.

## Question
Explain the TCP three-way handshake, and how you'd spot a port scan or a SYN flood in a packet capture.

## Quick Answer
**SYN → SYN-ACK → ACK.** A **port scan** shows one source firing SYNs at many ports/hosts with few completed handshakes (SYN scans get SYN-ACK then RST). A **SYN flood** is a volumetric DoS: a flood of SYNs (often spoofed) whose final ACK never arrives, exhausting the server's half-open connection queue.

## Detailed Answer
**The handshake:**
1. **SYN** — client → server, `SEQ=x`, requesting a connection.
2. **SYN-ACK** — server → client, `SEQ=y, ACK=x+1`, agreeing and synchronizing.
3. **ACK** — client → server, `ACK=y+1`. Connection established; both sides' sequence numbers are synced.

Teardown, for contrast, is FIN/ACK each way (or an abrupt RST).

**Spotting a port scan:**
- One source → many destination ports (or many hosts), lots of SYNs, few full handshakes.
- **SYN (half-open) scan:** SYN → SYN-ACK → **RST** (attacker never completes). Open ports answer SYN-ACK; closed ports answer RST/ACK.
- Wireshark: `Statistics → Conversations` shows a single src fanning out; filter with
  ```
  tcp.flags.syn==1 && tcp.flags.ack==0
  ```
  and note the volume of RSTs. Sequential or scripted destination ports are a tell.

**Spotting a SYN flood (DoS):**
- Very high volume of SYNs, frequently from **spoofed / many source IPs**, with **no completing ACK**.
- The server sends SYN-ACKs (and **retransmits** them, unanswered) while its backlog of half-open connections fills — legitimate clients then can't connect.
- The distinction from a scan is **intent and volume**: a scan enumerates (few packets, many ports); a flood exhausts resources (massive packets, often one target port like 80/443).

**Mitigations worth naming:** SYN cookies, connection rate-limiting, and upstream firewall/IPS or DDoS scrubbing.

## Interview Delivery Tip
This is a fundamentals check — answer crisply and correctly, then add the operational layer ("in a capture I'd confirm with `Statistics → Conversations` and the SYN-without-ACK filter"). Getting the sequence-number increments (`x+1`, `y+1`) right signals real protocol depth.

## MITRE ATT&CK touchpoints
Reconnaissance — T1595.001 (Active Scanning: Scanning IP Blocks); Impact — T1498/T1499 (Network / Endpoint Denial of Service).

## 🔗 Related
- [[TCP Flags and Control Bits]]
