---
type: interview-question
question: "A customer calls convinced they've been breached — walk me through your first 30 minutes."
domain: [ir, analyst]
role: [principal-analyst-l3, soc-analyst]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ A customer calls convinced they've been breached — walk me through your first 30 minutes.

## Question
A customer calls in convinced they've been breached. Walk me through your first 30 minutes.

## Quick Answer
Stay calm and take control of the call; **gather facts before drawing conclusions**; open a case and start documenting; establish scope and preserve evidence (isolate, don't power off); **validate whether there's a real indicator** or a misread; if confirmed, recommend authorized containment; and keep the customer informed with a clear cadence the whole way. Verify → scope → contain → communicate.

## Detailed Answer — phased

**Minutes 0–5: Take the call and stabilize it.**
- Calm, professional tone — the customer is stressed; I set the pace. I reassure them they've done the right thing by calling and that we'll work it methodically.
- Open a **case immediately** and start a timestamped log — everything from here is documented for chain of custody.
- Establish a **single point of contact** on their side and confirm how we'll stay in touch.

**Minutes 5–15: Gather facts — resist conclusions.**
- What did they see, exactly? When did it start? Which **users, hosts, or systems**? What made them think "breach" — an alert, a ransom note, odd behavior, a third-party notification?
- Any **recent changes** — new software, config changes, a phishing click, admin actions?
- Critical mindset: a large share of "we've been breached" calls are misreads (a legit admin tool, a failed-but-blocked attack, a false positive). I **validate the trigger** rather than accept the framing.

**Minutes 10–20: Preserve evidence & scope (overlaps with fact-gathering).**
- Guidance to the customer: **do not power affected systems off** — that destroys volatile memory. **Isolate from the network** instead (or I isolate via EDR if we manage it).
- Identify affected assets and begin triage in the telemetry I have — EDR, SIEM (Sentinel/Splunk/Exabeam/XSIAM), auth logs, proxy/DNS. Pull the process lineage, logons, and network connections around the reported time (see [[Analyst - Investigate Windows Host Compromise]] / [[Analyst - Investigate Linux Host Compromise]]).

**Minutes 20–30: Determine, contain, communicate.**
- **Real indicator vs. not?** If the evidence confirms malicious activity, I classify it as an incident and move to containment. If it doesn't, I say so clearly and explain what I checked — a calm "here's why this isn't what it looked like" is a valuable deliverable too.
- **Containment is customer-authorized.** On an MSSP engagement I recommend and, where our scope allows, execute — isolate host, disable account, block IOC — but I balance business impact and get the customer's go-ahead for disruptive actions.
- **Set expectations:** what I've found so far, what I'm doing next, what I need from them, and **when I'll update them next**. Then escalate/engage the IR team and their management per the response plan.

## What the interviewer is listening for
- **Calm + methodical**, not a tool-name data-dump.
- **You don't jump to "breach"** — you verify first. (Big maturity signal.)
- **Evidence preservation** (isolate, don't power off) and **chain-of-custody documentation**.
- **Containment requires authorization** in a customer environment — you don't act unilaterally.
- **Communication cadence** — the customer is never left in the dark.

## One-line frameworks to drop
- "**Verify before you declare, scope before you contain, and communicate the whole way through.**"
- Containment / eradication / recovery is the same IR lifecycle I run internally — the difference at an MSSP is that I'm **guiding the customer through it** and translating each step into their terms.

## MITRE / process anchors
IR lifecycle (Preparation → Detection & Analysis → Containment/Eradication/Recovery → Post-Incident). Map confirmed activity to ATT&CK as you scope, so the customer report speaks a common language.
