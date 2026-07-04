---
type: interview-question
question: "Write a KQL query to detect a brute-force or password-spray attempt."
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

# ❓ Write a KQL query to detect a brute-force or password-spray attempt.

## ✅ Quick Answer
Aggregate failed logons over a time window and flag whatever crosses a threshold. **Brute force** = many failures against one account from one source. **Password spray** = few failures against many accounts — so pivot the grouping and count distinct accounts with `dcount`.

Brute force (on-prem, SecurityEvent 4625):
```kql
SecurityEvent
| where TimeGenerated > ago(1h)
| where EventID == 4625
| summarize Failures = count(), Accounts = make_set(TargetAccount)
    by SourceIP = IpAddress, bin(TimeGenerated, 10m)
| where Failures > 20
| sort by Failures desc
```

Password spray (Azure AD, SigninLogs):
```kql
SigninLogs
| where TimeGenerated > ago(1h)
| where ResultType != 0                       // failed sign-ins
| summarize SprayedAccounts = dcount(UserPrincipalName), Attempts = count()
    by IPAddress, bin(TimeGenerated, 15m)
| where SprayedAccounts > 10                   // many accounts = spray
```

## 🗣️ Talking points
- Tune thresholds to a baseline; a busy VPN gateway needs different numbers than a laptop.
- Brute vs spray is just a change of `by` grouping (per-account vs per-source-across-accounts).
- Correlate a *successful* logon right after the failures to catch an actual hit.
- Widen the window to catch low-and-slow spraying.
- Enrich `SourceIP`/`IPAddress` with geo and threat intel.

## ⚠️ Follow-ups they'll hit you with
- How would you catch low-and-slow spraying?
- How do you cut false positives from a misconfigured service account?

## 🔗 Related
- [[Analyst - Brute Force vs Password Spraying]]
- [[Analyst - Windows Failed Login Investigation]]
