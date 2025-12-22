---

type: moc tags:

- moc
- roles

---

# 👥 Cybersecurity Roles - Interview Questions

Browse interview questions organized by cybersecurity role. Each role has tier-specific questions from entry-level to senior positions.

---

## 🛡️ SOC Analyst

**Role Overview:** Security Operations Center analysts monitor, detect, analyze, and respond to security incidents using SIEM and other security tools.

**Tiers:**

- **Tier 1 (Alert Analyst):** Alert triage, basic investigation, escalation
- **Tier 2 (Incident Responder):** Deep investigation, containment, remediation
- **Tier 3 (Threat Hunter/Senior):** Proactive hunting, detection engineering, mentoring

### Question Categories

```dataview
TABLE 
  difficulty as "Level",
  confidence as "Conf",
  status as "Status"
FROM "02_Roles/SOC-Analyst"
WHERE type = "interview-question"
SORT difficulty ASC, file.name ASC
```

**Key Skills to Demonstrate:**

- Log analysis (Windows Event Logs, Syslog)
- SIEM query writing (SPL, KQL)
- Network traffic analysis
- Malware analysis basics
- Incident response procedures
- Communication skills for escalation

---

## 🚨 Incident Response

**Role Overview:** Specialized in responding to and recovering from security incidents, conducting forensics, and improving detection capabilities.

**Focus Areas:**

- NIST IR Lifecycle (Preparation → Detection → Containment → Eradication → Recovery → Lessons Learned)
- Digital forensics (memory, disk, network)
- Malware analysis
- Root cause analysis
- Post-incident reporting

### Question Categories

```dataview
TABLE 
  difficulty as "Level",
  domain as "Domain",
  confidence as "Conf"
FROM "02_Roles/Incident-Response"
WHERE type = "interview-question"
SORT difficulty ASC
```

**Key Skills to Demonstrate:**

- Forensic tool proficiency (Volatility, FTK, EnCase)
- Chain of custody understanding
- Evidence preservation
- Timeline construction
- Threat intelligence correlation
- Crisis communication

---

## 🔍 Threat Intelligence

**Role Overview:** Collect, analyze, and disseminate threat intelligence to inform security decisions and improve defenses.

**Intelligence Types:**

- **Strategic:** Long-term trends, board-level
- **Operational:** TTPs, campaign tracking
- **Tactical:** IOCs, specific threats

### Question Categories

```dataview
TABLE 
  difficulty as "Level",
  domain as "Domain",
  confidence as "Conf"
FROM "02_Roles/Threat-Intelligence"
WHERE type = "interview-question"
SORT difficulty ASC
```

**Key Skills to Demonstrate:**

- MITRE ATT&CK framework mastery
- Threat intelligence platforms (MISP, ThreatConnect)
- STIX/TAXII protocols
- Diamond Model, Kill Chain
- Intelligence lifecycle
- Reporting for different audiences

---

## ⚙️ Security Engineer

**Role Overview:** Design, implement, and maintain security infrastructure, tools, and processes across the organization.

**Responsibilities:**

- Security tool deployment (SIEM, EDR, WAF, etc.)
- Vulnerability management
- Security automation and orchestration
- IAM implementation
- Cloud security configuration
- DevSecOps integration

### Question Categories

```dataview
TABLE 
  difficulty as "Level",
  domain as "Domain",
  confidence as "Conf"
FROM "02_Roles/Security-Engineer"
WHERE type = "interview-question"
SORT difficulty ASC
```

**Key Skills to Demonstrate:**

- Multi-cloud security (AWS, Azure, GCP)
- Scripting for automation (Python, PowerShell)
- Security tool administration
- Network security architecture
- Compliance frameworks
- CI/CD security integration

---

## 🏗️ Security Architect

**Role Overview:** Design enterprise-wide security strategies, architectures, and frameworks aligned with business objectives.

**Focus Areas:**

- Zero Trust Architecture
- Threat modeling (STRIDE, PASTA)
- Security roadmap development
- Risk assessment and management
- Compliance mapping (SOC 2, ISO 27001, NIST)
- Architecture review and approval

### Question Categories

```dataview
TABLE 
  difficulty as "Level",
  domain as "Domain",
  confidence as "Conf"
FROM "02_Roles/Security-Architect"
WHERE type = "interview-question"
SORT difficulty ASC
```

**Key Skills to Demonstrate:**

- Strategic thinking and long-term planning
- Architecture design patterns
- Risk-based decision making
- Stakeholder communication
- Industry standards knowledge
- Trade-off analysis

---

## 🎯 Penetration Tester / Red Team

**Role Overview:** Simulate real-world attacks to identify vulnerabilities and test defensive capabilities.

**Specializations:**

- Web application testing
- Network penetration testing
- Cloud security assessment
- Red team operations (adversary simulation)
- Social engineering
- Physical security testing

### Question Categories

```dataview
TABLE 
  difficulty as "Level",
  domain as "Domain",
  confidence as "Conf"
FROM "02_Roles/Penetration-Tester"
WHERE type = "interview-question"
SORT difficulty ASC
```

**Key Skills to Demonstrate:**

- Offensive tool proficiency (Metasploit, Burp Suite, Cobalt Strike)
- Exploitation techniques
- Post-exploitation and persistence
- Report writing for technical and executive audiences
- OPSEC and ethical considerations
- Remediation recommendations

---

## 👔 Security Operations Manager

**Role Overview:** Lead security operations teams, manage incidents, develop processes, and interface with executive leadership.

**Responsibilities:**

- Team building and mentoring
- 24/7 SOC operations management
- Metrics and KPI reporting
- Budget and resource allocation
- Vendor management
- Executive communication
- Process improvement

### Question Categories

```dataview
TABLE 
  difficulty as "Level",
  domain as "Domain",
  confidence as "Conf"
FROM "02_Roles/Security-Manager"
WHERE type = "interview-question"
SORT difficulty ASC
```

**Key Skills to Demonstrate:**

- Leadership and people management
- SOC metrics (MTTD, MTTR, SLA compliance)
- Budget justification
- Risk communication to non-technical stakeholders
- Crisis management
- Strategic planning

---

## 🎯 Cross-Role Questions

Some questions apply across multiple roles. Find them in:

- [[03_Technical/|Technical Domains]] - Questions organized by technology
- [[04_Scenarios/|Scenarios]] - Situation-based questions
- [[05_Behavioral/|Behavioral]] - Soft skills and situational questions

---

## 📊 Role Comparison Matrix

|Role|Technical Depth|Leadership|Hands-on|Strategic|
|---|---|---|---|---|
|SOC Analyst (T1-T2)|●●●|●|●●●●●|●|
|SOC Analyst (T3)|●●●●|●●|●●●●●|●●|
|Incident Response|●●●●●|●●|●●●●|●●|
|Threat Intel|●●●●|●●|●●●|●●●|
|Security Engineer|●●●●●|●●|●●●●|●●●|
|Security Architect|●●●●|●●●|●●|●●●●●|
|Penetration Tester|●●●●●|●|●●●●●|●|
|Security Manager|●●●|●●●●●|●●|●●●●|

---

_Return to [[Home]]_