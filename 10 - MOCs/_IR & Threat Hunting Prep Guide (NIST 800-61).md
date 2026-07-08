---
type: moc
tags: [dashboard, guide]
domain: [ir, threat-hunting]
role: [principal-analyst-l3, soc-analyst, dfir]
---

# 🚨 IR & Threat Hunting Prep Guide (NIST 800-61)

A themed prep set for incident-lifecycle, EDR/SIEM, and hunting questions — with the
framework fluency interviewers probe for.

## ⚠️ The framework nuance you MUST get right
There are **two versions of NIST SP 800-61**, and naming both is the flex:

| | **Rev 2 (2012)** — "Computer Security Incident Handling Guide" | **Rev 3 (April 2025)** — CSF 2.0 Community Profile |
|---|---|---|
| Model | Four-phase **lifecycle** | Mapped to **CSF 2.0's six Functions** |
| Phases | 1. Preparation · 2. Detection & Analysis · 3. Containment, Eradication & Recovery · 4. Post-Incident Activity | **Govern, Identify, Protect** (preparation) + **Detect, Respond, Recover** (handling) + **Improvement** (continuous) |
| Status | **Withdrawn** | **Current** — supersedes Rev 2 |

**How to say it:** *"The four-phase lifecycle everyone cites is Rev 2 — Preparation; Detection & Analysis; Containment, Eradication & Recovery; Post-Incident. As of Rev 3 in April 2025, NIST re-mapped IR onto CSF 2.0's six functions, so containment and eradication now live under **Respond**, and recovery under **Recover**. I still think in the four phases operationally, but I know the current doc is CSF-aligned."*

That single sentence tells an interviewer you read past the 2012 PDF everyone else memorized.

## 📚 Questions in this set
- [[NIST 800-61 - Lifecycle Rev2 vs Rev3]] — the framework itself
- [[IR - Ransomware Containment & Eradication (Client System)]] — the headline scenario
- [[Hunting - Parse Normalize Extract from Unstructured Data]] — data-side of threat hunting
- [[EDR - Investigating a Detection]] — endpoint telemetry analysis
- [[SIEM - Log Analysis End to End]] — raw logs → incident

> [!tip] Drill these with the Command Center + note-review queue like the rest of the vault.
