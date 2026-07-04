---
type: interview-question
question: "How do you correlate and enrich data across tables in KQL?"
domain: [analyst, engineering]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you correlate and enrich data across tables in KQL?

## ✅ Quick Answer
Use `join` to correlate events across tables (e.g. failed-then-successful logon), `lookup` for dimension tables, and `externaldata`/watchlists to enrich with threat intel. Mind the join `kind` (inner / leftouter / leftanti) and put the smaller table on the left for performance.

Correlate failures with a later success:
```kql
let failures = SecurityEvent
    | where EventID == 4625
    | summarize Failures = count() by Account, IpAddress;
SecurityEvent
| where EventID == 4624                        // successful logon
| join kind=inner failures on Account
| where Failures > 10
| project Account, IpAddress, Failures, LogonTime = TimeGenerated
```

Enrich against a threat-intel list:
```kql
let badIPs = externaldata(ip:string)
    [@"https://example.com/badips.csv"] with (format="csv");
DeviceNetworkEvents
| where RemoteIP in (badIPs)
```

## 🗣️ Talking points
- Join kinds: `inner`, `leftouter`, and `leftanti`/`leftsemi` (present/absent in the other set).
- `$left` / `$right` disambiguate columns when keys differ.
- `lookup` is optimized for enriching against a dimension table.
- In Sentinel, `_GetWatchlist()` pulls managed watchlists.
- Performance: filter both sides first; smaller result set on the left.

## ⚠️ Follow-ups they'll hit you with
- When would you use a `leftanti` join? (find things *not* in a set)
- Inner versus leftouter — what changes in the output?

## 🔗 Related
- [[KQL - KQL Fundamentals for Analysts]]
- [[ThreatIntel - Operationalizing Threat Intelligence]]
