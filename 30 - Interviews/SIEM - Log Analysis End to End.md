---
type: interview-question
question: "Walk me through SIEM log analysis — how do you go from raw logs to a confirmed incident?"
domain: [analyst, ir]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Walk me through SIEM log analysis — how do you go from raw logs to a confirmed incident?

## ✅ Quick Answer
Onboarded sources are parsed and **normalized to a common model**, then I query and **correlate across endpoint, identity, and network** to turn an alert into a scoped incident. Triage = validate → enrich → scope → timeline → TP/FP call, then tune the detection so the next one is cleaner.

## 🗣️ Walk-through
- **Sources & normalization** — endpoint, identity, network, cloud, app logs mapped to **CIM / ASIM / ECS** so fields line up across sources.
- **Query** — Splunk SPL (`stats`, `rex`, `tstats`, `transaction`) or Sentinel KQL (`where`, `summarize`, `join`, `parse`).
- **Correlate** — rules that chain events (failed logons → success → privilege change), ideally **risk-based alerting** to cut noise.
- **Triage** — enrich (intel/asset/user), scope the blast radius, build a timeline, dedupe, decide true vs false positive.
- **Tune** — refine or write detections; measure efficacy (FP rate, ATT&CK coverage, MTTD/MTTR).

## 💻 Example talk-tracks
**Encoded PowerShell (SPL):**
```
index=endpoint Image="*\\powershell.exe" (CommandLine="*-EncodedCommand*" OR CommandLine="*FromBase64String*")
| stats count values(CommandLine) by host, user
```
**Failed-then-success auth (KQL):**
```
SigninLogs
| summarize failures=countif(ResultType!=0), successes=countif(ResultType==0) by UserPrincipalName, IPAddress, bin(TimeGenerated, 1h)
| where failures > 10 and successes > 0
```
Always say *why*: "I correlate execution to identity and network to move from alert to incident."

## 🧠 Senior signals
Know **index-time vs search-time** extraction, data models, and **log-source health / coverage gaps** — a missing source is a detection gap, which is itself a finding.

## 🔗 Related
- [[EDR - Investigating a Detection]]
- [[Hunting - Parse Normalize Extract from Unstructured Data]]
