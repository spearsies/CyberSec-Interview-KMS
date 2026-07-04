---
type: concept
tags: [theme/detection]
---

# IOC vs IOA

## Overview
**IOCs** (Indicators of Compromise) are forensic artifacts of a known/past compromise — hashes, IPs, domains, registry keys. **IOAs** (Indicators of Attack) describe behavior and intent in progress — e.g. process injection, credential dumping — regardless of the specific tooling. IOAs are more resilient because behavior is harder to change than artifacts.

## Key details
- IOC = "what we've seen before"; IOA = "what an attack looks like as it happens."
- IOCs decay quickly (attackers rotate infrastructure); IOAs map to TTPs.
- Good detection programs lean toward IOAs / behavior.

## 🔗 Related
- [[Pyramid of Pain]]
- [[Analyst - Pivoting on Indicators of Compromise]]
- [[Analyst - What Makes a Good Detection Rule]]
