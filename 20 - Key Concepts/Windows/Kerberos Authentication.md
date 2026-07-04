---
type: concept
tags: [theme/windows]
---

# Kerberos Authentication

## Overview
Kerberos is the default Active Directory authentication protocol, using tickets issued by a Key Distribution Center (KDC) so credentials aren't sent to each service.

## The flow
1. **AS-REQ / AS-REP** — client authenticates to the KDC and receives a Ticket Granting Ticket (TGT).
2. **TGS-REQ / TGS-REP** — client presents the TGT to get a service ticket.
3. Client presents the **service ticket** to the target service.
The `KRBTGT` account signs TGTs.

## Security relevance (common abuses)
- **Kerberoasting** — request and crack a service ticket offline.
- **AS-REP roasting** — accounts without pre-auth.
- **Golden Ticket** — forged TGT via the KRBTGT hash; **Silver Ticket** — forged service ticket.
- **Pass-the-Ticket** — reuse stolen tickets.

## 🔗 Related
- [[Analyst - Detecting Kerberoasting]]
- [[Analyst - Active Directory Attack Paths]]
- [[ThreatHunt - Detecting Lateral Movement]]
