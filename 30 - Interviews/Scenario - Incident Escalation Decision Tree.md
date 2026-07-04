---
type: interview-question
question: "Walk me through your incident-escalation decision tree."
domain: [ir, analyst]
role: [principal-analyst-l3, soc-analyst, dfir]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ Walk me through your incident-escalation decision tree.

## Question
"Walk me through how you decide whether — and to whom — to escalate an incident." / "When would you *not* escalate?"

## Quick Answer
Six steps: **preserve context → confirm real vs. benign → severity by business impact → containment decision → scope the blast radius → escalate with a crisp package, then track to resolution.** In financial services, escalation is driven by *impact* (client data, credentials, regulatory thresholds) more than by how interesting the malware is. **"Contain fast, but don't destroy the story."**

## The decision tree — say it like you've used it

**Step 0 — Safety rails (always first).** Open a case, timestamp actions, capture the alert payload / host+user IDs / raw logs. No "cleanup" before scoping unless risk is extreme.

**Step 1 — Is it real?** Do I have behavioral evidence beyond a single IOC?
- Process lineage (parent/child), command line, signed vs. unsigned binary, account context, network corroboration (beaconing, new destinations, odd ports).
- Unclear → classify **Suspected**, keep scoping. Benign → close *with evidence + a tuning recommendation*.
- Only close benign if you can name: expected tool + expected user + expected time + expected scope — and document why.

**Step 2 — Severity by business impact.** Escalate immediately if **any** are true:
1. Client/PII data risk (accounts, advisor books, transaction systems)
2. Credential compromise (privileged / service / advisor accounts especially)
3. Active-intrusion indicators (hands-on-keyboard, lateral movement)
4. Material service impact (core systems)
5. Regulatory reporting threshold may be met — *even if only suspected*

**Step 3 — Containment (speed vs. evidence).** Isolate immediately on active C2 + egress, privileged-account involvement, ransomware/wiper indicators, or rapid spread. Delay isolation only *minutes* — and only to grab key artifacts (process tree, netconns, memory) without increasing risk.

**Step 4 — Scope the blast radius.** Pivot: identity (odd logins, MFA resets, auth failures), endpoint (same lineage/persistence across hosts), network (same dest IP/port, beaconing, DNS anomalies), email (same campaign). Scope grows past one asset/user → escalate to IR if not already. *(See [[Analyst - Investigate Windows Host Compromise]] / [[Analyst - Investigate Linux Host Compromise]] for the artifact-level pivots.)*

**Step 5 — Escalate to the right place.**
- **IR lead / on-call** when any Step 2 critical hits, you need coordinated multi-team containment, or a reportable/legal angle appears.
- **Detection Engineering / Threat Hunt** when you find a new behavioral pattern worth an enterprise sweep, or repeated low/med alerts reveal a coverage gap.

**Step 6 — Track to resolution + close the loop.** Root cause, timeline, recovery steps, and detection improvements (new/modified alerts). This is the part that turns an incident into fewer future incidents.

## Escalation message template (gold — memorize this)
> "**[High]**-confidence suspected compromise on **[host/user]**. Evidence: **[1–2 facts]**. Scope so far: **[entities / time range]**. Actions taken: **[isolated / blocked / reset]**. Risk: **[creds / data / service]**. Request: **[approval to isolate more / forensics / comms]**."

Six lines: what happened, confidence + why, scope, impact, actions, and *what you need*. That package is what separates "analyst" from "trusted operator."

## "When would you NOT escalate?"
When you can fully explain it as benign — expected tool, user, time, and scope — **and** you've documented that reasoning and, ideally, filed a tuning note so the noisy alert improves. Non-escalation is a *documented decision*, not a shrug.

## Delivery tip
The interviewer is testing 2 AM judgment. Emphasize: preserve-before-you-act, impact-first severity, authorized containment, and the crisp handoff package.
