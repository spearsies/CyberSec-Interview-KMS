---
type: interview-question
question: "A critical client system is actively compromised by ransomware — what are your containment and eradication steps?"
domain: [ir, analyst, forensics]
role: [principal-analyst-l3, soc-analyst, dfir]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ A critical client system is actively compromised by ransomware — what specific containment and eradication steps would you take? (Reference NIST 800-61.)

## ✅ Quick Answer
Move fast but preserve evidence: **isolate, don't power off**; stop lateral spread; kill compromised accounts and C2; then eradicate the foothold — not just the payload — and recover only from verified known-good backups. Anchor it to 800-61's **Containment → Eradication → Recovery** (Rev 3: the **Respond** and **Recover** functions), and, because it's a *client* system, gate every disruptive action on their authorization.

## 🗣️ Walk-through (say it in this order)

**1. Detection & Analysis (Detect) — confirm and scope first.**
- Confirm ransomware and identify the variant (ransom note, file extension, known IOCs).
- Is encryption in progress or done? Where's patient zero? How many hosts? Is it spreading?
- Check for **data exfiltration** — most modern ransomware is double-extortion (steal *then* encrypt), which changes the regulatory/notification picture.

**2. Containment (Respond) — speed matters, evidence matters more.**
- **Network-isolate** affected hosts (EDR containment or pull from the network). **Do NOT power off** — memory can hold keys/artifacts and shutting down destroys them.
- Stop the spread: disable compromised/privileged/service accounts, block C2 IOCs at firewall/proxy, cut lateral pathways (SMB, RDP), segment VLANs if needed.
- **Short-term vs long-term containment** (800-61 distinguishes them): stop-the-bleeding now, then temporary fixes that let the business keep running while you rebuild.
- **Preserve evidence** for forensics, insurance, law enforcement, and regulators: memory, disk images, logs, the ransom note, and a sample of encrypted files.
- **Client coordination (MSSP):** get explicit authorization for disruptive steps; translate impact into business terms; get their leadership, legal, and comms engaged early.

**3. Eradication (Respond) — remove the foothold, not just the payload.**
- Assume **dwell time exceeds the encryption event** — the actor was likely in for days/weeks. Hunt the whole environment for the same IOCs/TTPs and other backdoors (Cobalt Strike, dropped tooling, new scheduled tasks/services/run keys).
- **Find and close the initial access vector** (phished creds, exposed RDP, unpatched vuln, valid account).
- Reset compromised credentials — potentially domain-wide; if AD is compromised, a **KRBTGT double-reset**.
- Where integrity is in doubt, **reimage rather than clean**.

**4. Recovery (Recover) — clean restore, verified.**
- Restore from **offline/immutable known-good backups** — first verify the backups themselves aren't encrypted or tampered.
- Confirm the vector is closed *before* reconnecting; phased return to production with heightened monitoring for reinfection.

**5. Post-Incident (Rev 3: Identify→Improvement).**
- Root cause, timeline, detection gaps → new detections and a tabletop. Handle regulatory/contractual reporting (in financial services: potential SEC, GLBA, state breach laws, client SLAs).

## 🎤 Interview gold — lines to land
- *"Contain fast, but don't destroy the story — isolate, never power off."*
- *"I eradicate the foothold, not just the payload; dwell time almost always predates the encryption."*
- *"Whether to pay is a business and legal decision with OFAC/sanctions exposure — not the analyst's call. My job is clean recovery from known-good backups."*
- *"On a client system, every disruptive action is authorized by the customer and communicated in business terms."*

## 🔗 Related
- [[NIST 800-61 - Lifecycle Rev2 vs Rev3]]
- [[EDR - Investigating a Detection]]
