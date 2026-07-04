---
type: concept
tags: [theme/detection]
---

# Diamond Model

## Overview
An intrusion-analysis model built on four vertices — **Adversary, Capability, Infrastructure, Victim** — connected by edges. The core analytic move is *pivoting*: from one known vertex, discover the others.

## Key details
- Example: from Infrastructure (a C2 IP) pivot to Capability (the malware) and to other Victims that contacted it.
- Complements the Kill Chain (sequence) and ATT&CK (behavior).
- Underpins structured IOC pivoting during investigations.

## 🔗 Related
- [[Analyst - Pivoting on Indicators of Compromise]]
- [[IOC vs IOA]]
