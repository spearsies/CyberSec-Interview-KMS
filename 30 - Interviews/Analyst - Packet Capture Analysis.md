---
type: interview-question
question: "Walk me through analyzing a suspicious packet capture — what do you look for first?"
domain: [networking, forensics, analyst]
role: [principal-analyst-l3, soc-analyst]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Walk me through analyzing a suspicious packet capture — what do you look for first?

## Question
Walk me through analyzing a suspicious packet capture. What do you look for first?

## Quick Answer
Context first, then a top-down triage: establish the hypothesis, get the lay of the land with **Protocol Hierarchy** and **Conversations**, identify top talkers and odd protocols/ports, then hunt for beaconing, exfil, DNS anomalies, and unusual TLS/HTTP. Follow streams, extract objects, correlate against intel, and translate it into a plain-language finding + recommended action for the customer.

## Detailed Answer
**1. Start with context, not the packets.** What triggered this capture — an EDR/SIEM alert, an IOC, a customer report? That frames my hypothesis (e.g., "I expect C2 beaconing to a known-bad IP"). Analyzing a PCAP blind wastes time.

**2. Get the lay of the land.** In Wireshark:
- `Statistics → Protocol Hierarchy` — is there a protocol that shouldn't be there (IRC, unexpected TLS on odd ports, tons of DNS)?
- `Statistics → Conversations` — who are the top talkers, and are there long-lived or high-byte flows to external IPs?
- `Statistics → Endpoints` — flag external IPs to check against threat intel.

**3. Hunt the high-value indicators:**
- **Beaconing / C2** — regular, low-jitter connections to the same external host. The IO Graph or consistent time deltas between packets gives it away.
- **Exfiltration** — large outbound transfers, especially over DNS, HTTPS, or to cloud storage.
- **DNS anomalies** — high volume of TXT queries, unusually long or high-entropy subdomains (tunneling / DGA), NXDOMAIN storms.
- **HTTP** — suspicious User-Agents, POSTs of encoded data, downloads of PE/script files.
- **TLS** — self-signed certs, mismatched SNI, or fingerprint the client with JA3/JA3S to spot known malware stacks.
- **Handshake anomalies** — many SYNs with no completion = scanning (see [[Networking - TCP Handshake and Scan Detection]]).

**4. Go deep.** `Follow → TCP/HTTP Stream` to read payloads; `File → Export Objects` to carve out transferred files for hashing/detonation. Correlate IOCs (IPs, domains, hashes) against threat intel and the customer's other telemetry.

**5. Useful display filters to name out loud:**
```
http.request
dns
tcp.flags.syn==1 && tcp.flags.ack==0
tls.handshake.type==1
ip.addr == <suspect>
frame contains "<string>"
```

## Interview Delivery Tip (L3 / customer-facing)
Close the answer by connecting it to the job: "Then I'd document the finding in customer-readable terms — what happened, the evidence, the risk, and a recommended action — and escalate if it's a confirmed compromise." That shows you can do the deep work *and* communicate it, which is what separates L3 from L2 at an MSSP.

## MITRE ATT&CK touchpoints
Command and Control (T1071 App Layer Protocol, T1071.004 DNS), Exfiltration (T1041, T1048), Reconnaissance/Discovery (network scanning).
