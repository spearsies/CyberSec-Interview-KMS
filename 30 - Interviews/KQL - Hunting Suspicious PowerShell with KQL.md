---
type: interview-question
question: "Write KQL to hunt for suspicious PowerShell execution."
domain: [analyst, malware, threat-hunting]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Write KQL to hunt for suspicious PowerShell execution.

## ✅ Quick Answer
Query process-creation telemetry for PowerShell with suspicious arguments, and weight heavily on the *parent* process. `has_any` lets you match a whole set of indicators at once; an Office app spawning PowerShell is the strongest single signal.

```kql
DeviceProcessEvents
| where TimeGenerated > ago(7d)
| where FileName in~ ("powershell.exe","pwsh.exe")
| where ProcessCommandLine has_any
    ("-enc","-EncodedCommand","FromBase64String","IEX","Invoke-Expression",
     "DownloadString","DownloadFile","-nop","-w hidden","-ExecutionPolicy Bypass")
| project TimeGenerated, DeviceName, AccountName,
    InitiatingProcessFileName, ProcessCommandLine
| sort by TimeGenerated desc
```

Narrow to the highest-signal case — a document spawning PowerShell:
```kql
| where InitiatingProcessFileName in~ ("winword.exe","excel.exe","outlook.exe")
```

## 🗣️ Talking points
- `has_any` matches multiple indicators in one clause.
- `InitiatingProcessFileName` (parent) is the strongest signal — Office → PowerShell is a classic macro chain.
- Decode `-enc` payloads; pair with Event 4104 script-block logs for the real script.
- Reduce false positives by allow-listing signed/known admin scripts.

## ⚠️ Follow-ups they'll hit you with
- How do you get the real intent of a heavily obfuscated command?
- How do you cut false positives from legitimate admin scripting?

## 🔗 Related
- [[Analyst - Triage a Suspicious PowerShell Alert]]
- [[Analyst - Detecting Living-off-the-Land Binaries]]
