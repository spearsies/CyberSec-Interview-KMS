---
type: concept
tags: [theme/networking]
---

# DNS Fundamentals

## Overview
DNS resolves names to IPs through resolvers (recursive) and authoritative servers (iterative). It's foundational plumbing — and, because it's often unmonitored and allowed outbound, a favorite abuse channel.

## Key details
- Record types: A/AAAA, CNAME, MX, TXT, NS, PTR.
- Resolution: stub resolver → recursive resolver → root → TLD → authoritative.
- Security relevance: C2 and exfiltration via tunneling (long/high-entropy subdomains, TXT records), DGAs, and fast-flux.

## 🔗 Related
- [[ThreatHunt - Detecting DNS Tunneling and C2]]
- [[OSI Model]]
