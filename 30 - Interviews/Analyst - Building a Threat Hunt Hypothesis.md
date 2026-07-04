---
type: interview-question
question: "Walk me through how you build and run a threat hunt."
domain: [threat-hunting, analyst]
role: [soc-analyst, principal-analyst-l3]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Walk me through how you build and run a threat hunt.

## ✅ Quick Answer
A hunt is **hypothesis-driven**, not alert-driven. I start from a specific, testable hypothesis — usually an ATT&CK technique relevant to my threat model — decide what data would prove or disprove it, then query for the *behavior* (not just IOCs), triage what surfaces, and turn anything durable into a detection. The output of a good hunt is a new detection or a documented "clear," not a one-off dig.

## 🎯 Why they ask it
- Senior analysts proactively find what alerts miss. They want structured thinking, not random log grepping.

## 🗣️ Talking points
- Hypothesis sources: threat intel, ATT&CK, crown-jewel analysis, observed anomalies.
- Frame it testably — e.g. "an adversary is using WMI for lateral movement in our server VLAN."
- Map the hypothesis to data sources (Sysmon, EDR, proxy, DNS) *before* hunting; a gap here is itself a finding.
- Hunt behaviors/TTPs, not just hashes and IPs — baseline what's normal, then use stacking/frequency analysis to spot outliers.
- Document scope, queries, and findings so the hunt is repeatable.
- Close the loop: every hunt yields a new detection, a tuned rule, or a documented coverage gap.

## ⚠️ Follow-ups they'll hit you with
- Your hunt finds nothing — was it a failure?
- How do you prioritize which hypotheses to hunt first?

## 🔗 Related
- [[Analyst - Using MITRE ATT&CK in SOC Operations]]
- [[ThreatHunt - Detecting Lateral Movement]]
