---
title: "What is the difference between IDS and IPS?"
type: interview-question
created: 2025-01-15
modified: 2025-01-15

# Classification
domain: [network-security]
role: [soc-analyst, security-engineer]
difficulty: intermediate
question_type: technical

# Progress Tracking
confidence: 1
times_reviewed: 0
last_reviewed: 
status: new

# Spaced Repetition
sr-due: 2025-01-15
sr-interval: 1
sr-ease: 250

# Context
company_asked: []
source: "Common SOC analyst interview question"
tags:
  - flashcard
  - interview-question
  - security/network/ids-ips
  - tier1
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
## Question
What is the difference between an Intrusion Detection System (IDS) and an Intrusion Prevention System (IPS)?

## Quick Answer
**IDS detects and alerts** (passive monitoring), while **IPS detects and blocks** (active inline prevention).

## Detailed Answer

| Feature | IDS | IPS |
|---------|-----|-----|
| **Action** | Monitors traffic and alerts on suspicious activity | Monitors, alerts, AND blocks malicious traffic |
| **Position** | Out-of-band (passive tap/SPAN) | Inline with traffic flow |
| **Response** | Passive - sends alerts to SOC | Active - can drop packets, reset connections |
| **Latency** | No impact on network performance | Slight increase due to inspection |
| **Risk** | False positives = alerts only | False positives = blocked legitimate traffic |
| **Deployment** | Easier, lower risk | Requires careful tuning |

### Types:
- **HIDS/HIPS**: Host-based (monitors single system)
- **NIDS/NIPS**: Network-based (monitors network segments)

### Detection Methods:
1. **Signature-based**: Matches known attack patterns
2. **Anomaly-based**: Detects deviations from baseline
3. **Stateful protocol analysis**: Tracks protocol state

### Real-world Example:
- **IDS**: "Alert: Possible SQL injection from 192.168.1.50" → SOC analyst investigates
- **IPS**: "Blocked SQL injection from 192.168.1.50" → Attack stopped automatically

## Interview Tips
- **Mention trade-offs**: IPS can block legitimate traffic if misconfigured (false positives)
- **Reference real tools**: Snort (IDS/IPS), Suricata, OSSEC, Palo Alto Threat Prevention
- **Discuss tuning**: Importance of signature updates and tuning to reduce false positives
- **Talk about placement**: IDS for monitoring, IPS at network perimeter/critical segments

### Follow-up Questions You Might Get:
- "When would you choose IDS over IPS?"
- "How do you handle false positives in IPS?"
- "What's the difference between HIDS and NIDS?"

## Related Concepts
- [[C_Defense-in-Depth]]
- [[Q_Network_Snort-vs-Suricata]]
- [[C_Signature-vs-Anomaly-Detection]]
- [[Q_SOC_False-Positive-Handling]]

## Flashcard
IDS vs IPS difference::IDS detects and alerts (passive), IPS detects and blocks (active inline)
When to use IDS over IPS::When you want visibility without risk of blocking legitimate traffic, or for monitoring encrypted traffic
