---
type: concept
tags: [theme/networking]
---

# TCP Flags and Control Bits

## Overview
TCP control bits govern connection state. Reading them is central to spotting scans and floods in a capture.

## The flags
- **SYN** — initiate a connection (synchronize sequence numbers)
- **ACK** — acknowledge received data
- **FIN** — graceful close
- **RST** — abort/reset the connection
- **PSH** — push buffered data to the application
- **URG** — urgent pointer set

The 3-way handshake is `SYN → SYN-ACK → ACK`. A SYN scan never sends the final ACK (SYN → SYN-ACK → RST); a SYN flood withholds the ACK to exhaust the half-open queue.

## 🔗 Related
- [[Networking - TCP Handshake and Scan Detection]]
