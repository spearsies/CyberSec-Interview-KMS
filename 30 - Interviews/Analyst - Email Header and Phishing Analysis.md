---
type: interview-question
question: "How do you analyze an email's headers to investigate phishing?"
domain: [analyst, ir]
role: [soc-analyst, principal-analyst-l3]
difficulty: medium
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you analyze an email's headers to investigate phishing?

## ✅ Quick Answer
Read headers **bottom-up** to trace the real path: check the `Received` hops for the true origin, `Authentication-Results` for SPF/DKIM/DMARC verdicts, `Return-Path` versus `From` for mismatch, `Reply-To` for redirection, and the sender domain for look-alikes. Combine header facts with URL and attachment analysis to reach a verdict.

## 🗣️ Talking points
- `Received` chain: the bottom hop is the origin — but upstream hops are forgeable.
- `Authentication-Results` shows the SPF/DKIM/DMARC outcomes.
- `From` vs `Return-Path` vs `Reply-To` mismatches are red flags.
- Display-name spoofing and cousin/look-alike domains.
- Detonate URLs and attachments in a sandbox; extract IOCs.

## ⚠️ Follow-ups they'll hit you with
- Which header reveals the true sending IP?
- Why can the display name lie even when SPF passes?

## 🔗 Related
- [[Analyst - Email Authentication SPF DKIM DMARC]]
- [[Analyst - Safely Analyzing a Malicious Attachment]]
