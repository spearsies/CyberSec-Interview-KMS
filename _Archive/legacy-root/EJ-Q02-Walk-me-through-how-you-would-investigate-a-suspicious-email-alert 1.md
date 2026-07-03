---
type: interview
tags: [context/work, theme/cybersecurity, company/edward-jones, type/technical, skill/detection-engineering]
difficulty: medium
status: unreviewed
---
```
---
status: "To Study" # Options: "To Study", "Reviewing", "Mastered"
domain: ["Analyst"] # Options: "Analyst", "Engineering", "Cloud", "AppSec"
difficulty: 2 # Options: 1, 2, 3
tags: [interview, security]
last_reviewed: 2023-10-27
---
```
# Question: Walk me through how you would investigate a suspicious email alert

## Why it's asked
Employers want to gauge:
- Systematic investigation methodology
- Email security knowledge
- Artifact analysis skills (headers, links, attachments)
- Scope assessment abilities
- Decision-making on escalation
- Attention to detail
- Communication of findings

## Sample Response
> I follow a systematic approach to email investigation:

**Initial Triage (5 minutes):**
- Review alert details and context
- Identify recipient(s) and sender
- Check if user reported it or automated detection
- Determine if user interacted (opened, clicked, downloaded)

**Email Header Analysis:**
- Examine authentication results (SPF, DKIM, DMARC)
- Check sender reputation and geolocation
- Look for spoofing indicators (display name vs actual sender)
- Review email path (received headers) for anomalies
- Check reply-to discrepancies

**Content Examination:**
- Analyze URLs (expand shortened links, check domain reputation via VirusTotal, URLhaus)
- If attachments: check hash against threat intel (MalwareBazaar, VirusTotal)
- Look for phishing indicators: urgency, unusual requests, poor grammar
- Compare against known campaign patterns

**Scope Assessment:**
- Query SIEM/email gateway for similar emails
- Identify all recipients in organization
- Determine if any users interacted
- Check for broader campaign indicators

**Decision & Action:**
- **Benign:** Document false positive, close ticket
- **Phishing:** Quarantine email, block sender, notify users
- **Malware:** Escalate to IR, isolate affected endpoints
- **BEC/Fraud:** Immediate escalation to IR and fraud team

**Documentation:**
- Record all findings in case management system
- Note IOCs for future detections
- Update threat intel platform
- Create detection rule if part of campaign

**Example:**
Recently investigated a phishing email with malicious attachment. Header analysis showed spoofed sender, attachment hash matched known malware family in MalwareBazaar. Found 15 recipients, 3 opened attachment. Isolated their endpoints, removed malware, created email filter rule to block similar messages. Total response time: 45 minutes from detection to containment.

## Key Technical Talking Points
- **Methodology:** Triage → Header analysis → Content examination → Scope assessment → Action
- **Tools:** Email gateway, SIEM, threat intel platforms, sandbox
- **Artifacts:** Headers (SPF/DKIM/DMARC), URLs, attachments, sender reputation
- **Scope questions:** How many affected? Who interacted? Part of campaign?
- **Escalation criteria:** User clicked, malware detected, BEC indicators, sensitive data risk
- **Time management:** Quick triage (5 min), full investigation (20-30 min)
- **Documentation:** Complete timeline, IOCs, actions taken, lessons learned

````
graph TD
    A[Alert: Suspicious Login] --> B{Valid User?}
    B -- Yes --> C[Check Location/Device]
    B -- No --> D[Isolate Account]
    
    C --> E{Known Travel?}
    E -- No --> D
    E -- Yes --> F[False Positive - Close Alert]
    
    D --> G[Force Password Reset]
    D --> H[Revoke Active Sessions]
    G --> I[Notify User via Secondary Channel]
    H --> J[Perform Forensic Audit]
````

## Related Concepts
- [[Email Security]]
- [[Phishing Analysis]]
- [[Header Analysis]]
- [[Malware Triage]]
- [[Incident Response Workflow]]
- [[IOC Analysis]]
- [[Threat Intelligence Platforms]]
