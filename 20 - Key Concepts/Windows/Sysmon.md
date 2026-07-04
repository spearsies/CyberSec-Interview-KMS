---
type: concept
tags: [theme/windows]
---

# Sysmon

## Overview
Sysinternals **System Monitor** — a Windows driver/service that logs high-fidelity endpoint telemetry beyond the native logs, configured via an XML policy. A staple of endpoint detection.

## Key events
| Event ID | Meaning |
|---|---|
| 1 | Process creation (command line, hashes, parent) |
| 3 | Network connection |
| 7 | Image (DLL) loaded |
| 8 | CreateRemoteThread (process injection) |
| 10 | ProcessAccess (e.g. LSASS access) |
| 11 | File create |
| 13 | Registry value set |
| 22 | DNS query |

## 🔗 Related
- [[Analyst - Investigate Windows Host Compromise]]
- [[Windows Security Event IDs]]
- [[Analyst - Detecting Living-off-the-Land Binaries]]
