---
type: interview-question
question: "What are the core KQL operators you use to write detections in Sentinel or Defender?"
domain: [analyst, engineering]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ What are the core KQL operators you use to write detections in Sentinel or Defender?

## ✅ Quick Answer
KQL is a read-only, pipe-based query language: you start with a table and pipe (`|`) rows through operators that filter, reshape, and aggregate. The core set is `where` (filter), `project`/`extend` (select/compute columns), `summarize` (aggregate, usually with `bin()` for time buckets), `join`/`lookup` (enrich), `sort`/`top`, and `let` (variables). Filter early and bound the time range first for performance.

```kql
SecurityEvent
| where TimeGenerated > ago(24h)          // filter early + bound time
| where EventID == 4625                    // failed logons
| summarize Failures = count() by Account, bin(TimeGenerated, 1h)
| where Failures > 10
| sort by Failures desc
```

## 🗣️ Talking points
- Pipeline model: each `|` passes a table to the next operator; order matters (filter before summarize).
- `where` operators: `==`, `has` (fast token match), `contains` (slow substring), `in~`/`=~` (case-insensitive), `matches regex`.
- `summarize` with `count()`, `dcount()`, `sum()`, `make_set()` and a `by` grouping; `bin(TimeGenerated, 5m)` buckets time.
- `project` keeps/renames columns; `extend` adds computed ones — keep result sets small.
- `let` defines reusable variables, watchlists, and subqueries.
- Common tables: SecurityEvent, SigninLogs, DeviceProcessEvents, DeviceNetworkEvents, CommonSecurityLog.

## ⚠️ Follow-ups they'll hit you with
- What's the difference between `has` and `contains`, and why does it matter?
- Why filter before you summarize?

## 🔗 Related
- [[KQL - Summarize bin and Time-Series in KQL]]
- [[KQL - Joins and Enrichment in KQL]]
