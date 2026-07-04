---
type: concept
tags: [theme/windows]
---

# Windows Security Event IDs

## Overview
The high-value events in the Windows **Security** log that analysts pivot on during investigations.

## Key events
| Event ID | Meaning |
|---|---|
| 4624 | Successful logon (check **Logon Type**: 2 interactive, 3 network, 10 RDP) |
| 4625 | Failed logon |
| 4634 / 4647 | Logoff |
| 4648 | Logon using explicit credentials |
| 4672 | Special privileges assigned (admin logon) |
| 4688 | Process creation (+ command line, if audited) |
| 4720 / 4728 / 4732 | Account created / added to group |
| 4769 | Kerberos service ticket requested (Kerberoasting) |
| 7045 | Service installed (System log) |
| 4104 | PowerShell script-block logging |

## 🔗 Related
- [[Analyst - Windows Failed Login Investigation]]
- [[ThreatHunt - Detecting Lateral Movement]]
- [[Sysmon]]
