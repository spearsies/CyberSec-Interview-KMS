---
type: interview-question
question: "How would you hunt for C2 beaconing using KQL?"
domain: [networking, threat-hunting]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How would you hunt for C2 beaconing using KQL?

## ✅ Quick Answer
Beaconing is periodic, so compute the time between consecutive connections per source→destination pair and flag pairs with **low variance** (a regular interval) and enough repetitions. Ordered `prev()` deltas plus `stdev`, or `make-series` autocorrelation, surface the cadence even when the payload is HTTPS.

```kql
DeviceNetworkEvents
| where TimeGenerated > ago(1d)
| where isnotempty(RemoteIP) and RemotePort in (80, 443)
| order by DeviceName, RemoteIP, TimeGenerated asc
| serialize PrevTime = prev(TimeGenerated),
            PrevKey  = prev(strcat(DeviceName, RemoteIP))
| where PrevKey == strcat(DeviceName, RemoteIP)
| extend DeltaSec = datetime_diff('second', TimeGenerated, PrevTime)
| summarize Connections = count(), AvgInterval = avg(DeltaSec),
    Jitter = stdev(DeltaSec) by DeviceName, RemoteIP
| where Connections > 30 and Jitter < 30      // regular cadence, low jitter
| sort by Jitter asc
```

> Illustrative — production versions partition carefully and often use `make-series` + FFT/autocorrelation.

## 🗣️ Talking points
- Low interval `stdev` = beacon; that's the core signal.
- Account for jitter — widen the threshold, since malware randomizes the interval.
- Layer in consistent byte counts and destination reputation/age.
- False positives: update services and telemetry are also periodic — baseline and allow-list them.

## ⚠️ Follow-ups they'll hit you with
- How does attacker-added jitter defeat a naive version of this?
- What about beacons over rare, non-web ports?

## 🔗 Related
- [[ThreatHunt - Detecting C2 Beaconing]]
- [[KQL - Summarize bin and Time-Series in KQL]]
