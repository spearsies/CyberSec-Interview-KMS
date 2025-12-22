---

title: "Explain the NIST Incident Response Lifecycle" type: interview-question created: 2025-01-15 modified: 2025-01-15

# Classification

domain: [incident-response, frameworks] role: [incident-response, soc-analyst, security-manager] difficulty: intermediate question_type: technical

# Progress Tracking

confidence: 1 times_reviewed: 0 last_reviewed: status: new

# Spaced Repetition

sr-due: 2025-01-15 sr-interval: 1 sr-ease: 250

# Context

company_asked: [] source: "NIST SP 800-61 Rev 2 - Computer Security Incident Handling Guide" tags:

- flashcard
- interview-question
- frameworks/nist
- ir/lifecycle
- essential

---

## Question

Explain the NIST Incident Response Lifecycle and the key activities in each phase.

## Quick Answer

The NIST IR Lifecycle has **4 phases**:

1. **Preparation**
2. **Detection & Analysis**
3. **Containment, Eradication & Recovery**
4. **Post-Incident Activity**

## Detailed Answer

### The NIST SP 800-61 IR Lifecycle

```
┌─────────────────────────────────────────────────┐
│         1. PREPARATION                          │
│  • Tools, policies, training, IR team           │
└──────────────┬──────────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────────┐
│      2. DETECTION & ANALYSIS                     │
│  • Identify incidents, scope, prioritize        │
└──────────────┬───────────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────────┐
│  3. CONTAINMENT, ERADICATION & RECOVERY          │
│  • Stop spread → Remove threat → Restore ops     │
└──────────────┬───────────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────────┐
│      4. POST-INCIDENT ACTIVITY                   │
│  • Lessons learned, improve defenses             │
└──────────────┬───────────────────────────────────┘
               │
               └──── Feeds back to PREPARATION
```

---

### Phase 1: PREPARATION

**Goal:** Build and maintain incident response capability before incidents occur

**Key Activities:**

- ✅ Develop IR policies, procedures, and playbooks
- ✅ Form and train IR team (roles, responsibilities)
- ✅ Acquire tools (forensics, monitoring, analysis)
- ✅ Establish communication channels and escalation paths
- ✅ Deploy prevention controls (hardening, patching, monitoring)
- ✅ Create incident classification/severity matrix
- ✅ Conduct tabletop exercises

**Deliverables:**

- Incident Response Plan (IRP)
- Contact lists (internal/external: legal, PR, law enforcement)
- Jump bags/forensics workstations
- Baseline system images

**Interview Insight:** _"Without preparation, you're just reacting. With it, you're executing a plan."_

---

### Phase 2: DETECTION & ANALYSIS

**Goal:** Identify potential incidents and determine scope/severity

**Key Activities:**

- 🔍 Monitor alerts from SIEM, EDR, IDS/IPS, firewall
- 🔍 Analyze indicators of compromise (IOCs)
- 🔍 Validate incidents (true vs. false positive)
- 🔍 Determine scope: systems affected, data at risk
- 🔍 Assign severity/priority based on impact
- 🔍 Document initial findings
- 🔍 Notify stakeholders per escalation matrix

**Detection Sources:**

- Automated alerts (SIEM, EDR, DLP)
- User reports (help desk, phishing reports)
- Threat intelligence feeds
- Third-party notifications (vendor, security researchers)

**Analysis Questions:**

- What happened? (attack vector, timeline)
- How did it happen? (vulnerability exploited)
- Who/what was affected? (scope)
- What's the potential impact? (data, systems, business)

**Challenges:**

- Alert fatigue and false positives
- Encrypted traffic limiting visibility
- Advanced persistent threats (APT) hiding in normal traffic
- Limited logging/retention

---

### Phase 3: CONTAINMENT, ERADICATION & RECOVERY

**Goal:** Stop the damage, remove the threat, restore normal operations

#### 3A. CONTAINMENT

**Short-term Containment (minutes to hours):**

- Isolate affected systems (network segmentation, disable network)
- Block malicious IPs/domains at firewall
- Disable compromised accounts
- Preserve evidence (memory dumps, disk images)

**Long-term Containment (hours to days):**

- Apply temporary patches/workarounds
- Deploy additional monitoring on affected segments
- Update detection rules
- Implement compensating controls

**Containment Strategy Example (Ransomware):**

```
Immediate: Isolate infected hosts at switch level
Short-term: Disable SMB shares, block C2 domains
Long-term: Segment network, apply patches, deploy EDR
```

#### 3B. ERADICATION

**Remove the threat completely:**

- Delete malware, backdoors, rootkits
- Remove unauthorized accounts/keys
- Patch vulnerabilities that enabled access
- Apply security updates
- Reset compromised credentials

**Verification:**

- Re-scan systems with multiple AV/EDR tools
- Review logs for persistence mechanisms
- Conduct threat hunting for similar IOCs

#### 3C. RECOVERY

**Restore systems to normal operation:**

- Rebuild systems from clean backups/images
- Restore data from verified clean backups
- Change all credentials (assume compromise)
- Gradually restore services (monitor closely)
- Validate business functionality
- Increase monitoring for relapse indicators

**Recovery Checklist:**

- [ ] Verify malware removal
- [ ] Patch vulnerabilities
- [ ] Reset all credentials
- [ ] Restore from clean backups
- [ ] Monitor for 48-72 hours post-recovery
- [ ] Validate business processes

---

### Phase 4: POST-INCIDENT ACTIVITY

**Goal:** Learn from the incident and improve defenses

**Key Activities:**

- 📋 Conduct lessons learned meeting (within 2 weeks)
- 📋 Document timeline and root cause
- 📋 Identify gaps in detection/response
- 📋 Update IR playbooks based on findings
- 📋 Implement security improvements
- 📋 Share IOCs with threat intelligence community
- 📋 Update metrics (MTTD, MTTR)

**Lessons Learned Questions:**

- What worked well?
- What could be improved?
- What new tools/processes are needed?
- How can we prevent similar incidents?
- Were detection capabilities adequate?
- Was communication effective?

**Continuous Improvement Loop:**

```
Incident → Response → Lessons Learned → 
Update Tools/Processes → Better Preparation → 
Faster Detection → Improved Response
```

---

## Interview Tips

### How to Demonstrate Expertise:

1. **Don't just list phases** - Give real examples from experience
2. **Emphasize preparation** - "Most IR success happens before an incident"
3. **Discuss trade-offs** - Containment vs. evidence preservation
4. **Mention metrics** - MTTD (Mean Time to Detect), MTTR (Mean Time to Respond)
5. **Reference specific incidents** - "During the ransomware incident at [previous company]..."

### Advanced Discussion Points:

**Parallel vs. Sequential Activities:**

- Detection and Containment often overlap
- Recovery may start before complete Eradication (business pressure)

**Evidence Preservation:**

- Chain of custody requirements
- Legal/forensics vs. business continuity tensions
- When to involve law enforcement

**Communication:**

- Internal: IT, Management, Legal, HR, PR
- External: Customers, regulators, law enforcement, media

### Common Follow-up Questions:

**Q: "What's the most critical phase?"** A: "Preparation - it determines how effective all other phases are. Without proper preparation, you're just reacting."

**Q: "When do you involve law enforcement?"** A: "Depends on: data theft severity, regulatory requirements, attribution needs. Generally coordinate with legal counsel first."

**Q: "How do you balance business continuity with evidence preservation?"** A: "Document everything, take forensic images early, then prioritize business recovery. Work with legal to determine evidence requirements."

### Example Framework Response:

> "The NIST IR Lifecycle has four phases. In **Preparation**, we built our IR team, developed playbooks, and deployed monitoring tools - this groundwork is critical because incidents move fast.
> 
> During **Detection & Analysis**, we use our SIEM to identify potential incidents, validate them, scope the impact, and assign severity. For example, [give specific example from your experience].
> 
> The **Containment, Eradication, and Recovery** phase involves first stopping the spread - like isolating infected systems during ransomware - then removing the threat completely, and finally restoring operations from clean backups while monitoring for relapse.
> 
> Finally, in **Post-Incident Activity**, we conduct lessons learned within two weeks, update our playbooks, and implement security improvements. This feeds directly back to Preparation, creating a continuous improvement cycle."

## Related Concepts

- [[C_Incident-Response-Planning]]
- [[Q_IR_Chain-of-Custody]]
- [[Q_IR_MTTD-vs-MTTR]]
- [[C_SANS-IR-Process]]
- [[Q_IR_Evidence-Collection]]
- [[S_IR_Ransomware-Response]]

## Flashcard

NIST IR Lifecycle phases::1. Preparation, 2. Detection & Analysis, 3. Containment/Eradication/Recovery, 4. Post-Incident Activity IR Preparation activities::Develop policies/playbooks, form IR team, acquire tools, establish communications, deploy prevention controls IR Detection sources::SIEM/EDR alerts, user reports, threat intel, third-party notifications Containment vs Eradication::Containment stops the spread (immediate), Eradication removes threat completely (thorough) Post-incident activity purpose::Lessons learned, improve defenses, update playbooks, share IOCs