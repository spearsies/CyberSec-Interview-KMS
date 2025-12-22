---

title: "What is the CIA Triad?" type: interview-question created: 2025-01-15 modified: 2025-01-15

# Classification

domain: [security-fundamentals] role: [soc-analyst, security-engineer, security-architect, all] difficulty: beginner question_type: technical

# Progress Tracking

confidence: 1 times_reviewed: 0 last_reviewed: status: new

# Spaced Repetition

sr-due: 2025-01-15 sr-interval: 1 sr-ease: 250

# Context

company_asked: [] source: "Fundamental security concept - asked in 90% of entry-level interviews" tags:

- flashcard
- interview-question
- security/fundamentals
- tier1
- essential

---

## Question

What is the CIA Triad and why is it important in cybersecurity?

## Quick Answer

CIA stands for **Confidentiality, Integrity, and Availability** - the three core principles of information security.

## Detailed Answer

### The Three Pillars:

1. **Confidentiality** 🔒
    
    - **Definition**: Information is accessible only to authorized individuals
    - **Controls**: Encryption, access controls, authentication, data classification
    - **Violation Example**: Data breach, unauthorized access, eavesdropping
    - **Real-world**: Encrypting sensitive customer data, role-based access control (RBAC)
2. **Integrity** ✓
    
    - **Definition**: Information is accurate, complete, and not tampered with
    - **Controls**: Hashing, digital signatures, checksums, version control, audit logs
    - **Violation Example**: Malware modifying system files, unauthorized data changes
    - **Real-world**: File integrity monitoring (FIM), code signing, blockchain
3. **Availability** ⚡
    
    - **Definition**: Information and systems are accessible when needed
    - **Controls**: Redundancy, backups, DDoS protection, disaster recovery, load balancing
    - **Violation Example**: DDoS attacks, ransomware, system failures
    - **Real-world**: 99.9% SLA uptime, high availability clusters, CDN

### Security Controls Mapping:

|Control Type|Confidentiality|Integrity|Availability|
|---|---|---|---|
|**Encryption**|✅ Primary|✅ Helps|❌|
|**Access Control**|✅ Primary|✅ Primary|❌|
|**Hashing**|❌|✅ Primary|❌|
|**Backups**|⚠️ If encrypted|✅ Helps|✅ Primary|
|**Firewall**|✅ Helps|✅ Helps|✅ Helps|
|**Monitoring**|⚠️ Detects violations|✅ Detects changes|✅ Detects outages|

### Real SOC Scenarios:

- **Confidentiality breach**: User credentials leaked in dark web dump
- **Integrity issue**: Malware modifying system registry keys
- **Availability threat**: DDoS attack saturating network bandwidth

## Interview Tips

### How to Discuss:

1. **Define each component clearly**
2. **Give real-world examples from your experience**
3. **Discuss trade-offs**: Sometimes CIA principles conflict (e.g., encryption protects confidentiality but may impact availability/performance)
4. **Relate to SOC work**: "In the SOC, we monitor for violations of all three..."

### Advanced Discussion Points:

- **Extended models**: CIA+AAA (Authentication, Authorization, Accounting)
- **Parkerian Hexad**: Adds Possession, Authenticity, Utility
- **Business context**: Different data requires different CIA emphasis

### Common Follow-ups:

- "Can you have confidentiality without integrity?"
- "Which is most important?" _(Answer: Depends on context/data classification)_
- "How does ransomware violate CIA?" _(Primarily Availability, sometimes Confidentiality)_

### Example Answer Framework:

> "The CIA Triad represents the three fundamental security objectives. In my work [at Edward Jones/previous role], we prioritized Confidentiality for customer financial data through encryption and strict access controls, Integrity through file integrity monitoring and audit logging, and Availability through redundant systems and our incident response procedures. A recent phishing incident required us to verify data Integrity while maintaining Confidentiality during the investigation..."

## Related Concepts

- [[C_Security-Fundamentals]]
- [[C_Access-Control-Models]]
- [[C_Defense-in-Depth]]
- [[Q_SOC_Data-Classification]]
- [[Q_Security_Parkerian-Hexad]]

## Flashcard

CIA Triad definition::Confidentiality (authorized access only), Integrity (accuracy/no tampering), Availability (accessible when needed) Confidentiality controls::Encryption, access controls, authentication, data classification Integrity controls::Hashing, digital signatures, checksums, FIM, audit logs Availability controls::Redundancy, backups, DDoS protection, disaster recovery, load balancing