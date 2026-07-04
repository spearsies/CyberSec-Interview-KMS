---
type: interview-question
question: "Describe your threat-hunting methodology."
domain: [threat-hunting, analyst]
role: [principal-analyst-l3, soc-analyst]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Describe your threat-hunting methodology.

## Question
Describe your threat-hunting methodology.

## Quick Answer
Hypothesis-driven and intelligence-led — not searching at random. Form a hypothesis from threat intel and ATT&CK, identify the data I need (and any coverage gaps), analyze with frequency/outlier techniques, investigate findings, and close the loop: escalate to IR if malicious, or convert the hunt into an automated detection if it's a gap. Document throughout.

## Detailed Answer
**1. Form a hypothesis.** Driven by something concrete: current threat intel, a TTP from **MITRE ATT&CK** relevant to the customer's industry, a recent CVE, or crown-jewel analysis. Example: *"An adversary is using PowerShell for living-off-the-land execution to evade AV."*

**2. Scope the data.** Decide what telemetry answers the hypothesis (EDR process data, Sysmon, proxy, DNS, auth logs). **If the data isn't there, that's a finding in itself** — a visibility gap that becomes a logging/detection-engineering recommendation.

**3. Analyze.** Pivot across sources and use structured techniques rather than eyeballing:
- **Stack counting / frequency analysis** — rare command lines, rare parent-child pairs (the "long tail" is where evil hides).
- **Outlier / anomaly detection** — unusual logon times, new services, beacon-like timing.
- **Grouping & clustering** around a suspect entity (host, account, IP).

**4. Investigate.** Confirm each hit as benign or malicious; chase the ones that survive scrutiny to root cause.

**5. Close the loop — this is the part that matters at L3:**
- Malicious → hand off to incident response with a documented timeline.
- Benign but a gap exists → **write a detection/analytic** so the hunt runs automatically next time. A hunt you have to repeat by hand is an unfinished hunt.
- Document the hypothesis, data, queries, and outcome so it's repeatable and teachable.

**Frameworks I lean on:** MITRE ATT&CK for TTP coverage; a structured model like **PEAK** or **TaHiTI**; and the **Pyramid of Pain** — I prefer to hunt on behaviors/TTPs (top of the pyramid) rather than brittle atomic IOCs like hashes.

## Interview Delivery Tip (L3 / MSSP)
Emphasize two L3 differentiators: (1) **turning hunts into detections** — shows detection-engineering maturity, which ties to my CTI/threat-hunting program-building experience; and (2) **per-customer tailoring** — at an MSSP each environment differs, so I baseline "normal" per customer before calling something an anomaly. Also mention mentoring juniors by walking them through the hypothesis→analytic loop.

## MITRE ATT&CK touchpoints
The framework *is* the methodology's backbone here — reference specific techniques when giving an example hunt (e.g., T1059.001 for the PowerShell hypothesis, T1071.004 for DNS C2).

## 🔗 Related
- [[MITRE ATT&CK]]
