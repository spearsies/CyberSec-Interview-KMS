---
type: interview-question
question: "How do you do time-series aggregation and anomaly detection in KQL?"
domain: [analyst, threat-hunting]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you do time-series aggregation and anomaly detection in KQL?

## ✅ Quick Answer
`summarize ... by bin(TimeGenerated, step)` buckets events into fixed intervals for trending. `make-series` builds a dense, gap-filled series you can chart with `render timechart` or feed into built-in anomaly functions like `series_decompose_anomalies()`.

Hourly failed-logon trend:
```kql
SecurityEvent
| where TimeGenerated > ago(7d) and EventID == 4625
| summarize Failures = count() by bin(TimeGenerated, 1h)
| render timechart
```

Per-account anomaly detection:
```kql
SecurityEvent
| where TimeGenerated > ago(14d) and EventID == 4625
| make-series Failures = count() default=0
    on TimeGenerated from ago(14d) to now() step 1h by TargetAccount
| extend (anomalies, score, baseline) =
    series_decompose_anomalies(Failures, 1.5)
| mv-expand TimeGenerated, Failures, anomalies, score
| where anomalies == 1
```

## 🗣️ Talking points
- `bin()` groups into time buckets; `make-series` fills gaps with a default — required for the anomaly math.
- `series_decompose_anomalies(series, sensitivity)` returns anomaly flags and scores.
- `render timechart` / `columnchart` for quick visual triage.
- `mv-expand` flattens a series back into rows for filtering.
- Great for baselining "normal" volume and spotting spikes/drops.

## ⚠️ Follow-ups they'll hit you with
- Why use `make-series` instead of `summarize` for anomaly detection?
- How do you choose the anomaly sensitivity?

## 🔗 Related
- [[KQL - KQL Fundamentals for Analysts]]
- [[KQL - Detecting Beaconing with KQL]]
