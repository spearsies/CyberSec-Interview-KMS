---
type: concept
tags: [theme/windows]
---

# LOLBins

## Overview
**Living-off-the-Land Binaries** — legitimate, signed OS tools that attackers abuse to download, execute, or hide payloads. Because the binaries are trusted and pre-installed, the abuse blends into normal activity.

## Common examples
- `certutil` — download files (`-urlcache`)
- `regsvr32` — run remote scriptlets (AppLocker bypass)
- `mshta` — execute remote HTA
- `rundll32` — invoke exported functions
- `bitsadmin`, `wmic`, `powershell`
Catalogued by the **LOLBAS** project. Detection focuses on suspicious arguments, parent-child anomalies, and network activity from binaries that shouldn't make connections.

## 🔗 Related
- [[Analyst - Detecting Living-off-the-Land Binaries]]
- [[Analyst - Triage a Suspicious PowerShell Alert]]
