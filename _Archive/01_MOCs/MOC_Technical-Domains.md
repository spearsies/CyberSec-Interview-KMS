---
type: moc
tags:
  - moc
  - technical
---

# 🔧 Technical Domains - Interview Questions

Browse interview questions organized by technical domain and technology area. These questions span multiple roles and are fundamental to cybersecurity knowledge.

---

## 🌐 Network Security

**Core Topics:**
- TCP/IP fundamentals and the OSI model
- Firewalls (stateful, stateless, next-gen)
- IDS/IPS systems
- VPNs and encrypted tunnels
- Network segmentation and VLANs
- Packet analysis with Wireshark
- DNS security and tunneling
- DDoS protection

```dataview
TABLE 
  difficulty as "Level",
  role as "Relevant Roles",
  confidence as "Conf"
FROM "03_Technical/Network-Security"
WHERE type = "interview-question"
SORT difficulty ASC, file.name ASC
```

---

## 💻 Endpoint Security

**Core Topics:**
- EDR (Endpoint Detection & Response)
- Antivirus vs Next-Gen AV
- Malware analysis (static and dynamic)
- Host-based firewalls
- Application whitelisting
- Patch management
- File Integrity Monitoring (FIM)
- Windows/Linux security hardening

```dataview
TABLE 
  difficulty as "Level",
  role as "Relevant Roles",
  confidence as "Conf"
FROM "03_Technical/Endpoint-Security"
WHERE type = "interview-question"
SORT difficulty ASC
```

---

## ☁️ Cloud Security

**Core Topics:**
- AWS security services (IAM, GuardDuty, Security Hub)
- Azure security (Sentinel, Defender, Conditional Access)
- GCP security (Cloud Armor, Security Command Center)
- Shared responsibility model
- Container security (Docker, Kubernetes)
- Serverless security
- Cloud-native SIEM
- Infrastructure as Code (IaC) security

```dataview
TABLE 
  difficulty as "Level",
  role as "Relevant Roles",
  confidence as "Conf"
FROM "03_Technical/Cloud-Security"
WHERE type = "interview-question"
SORT difficulty ASC
```

---

## 🛠️ Security Tools

**Core Topics:**
- **SIEM**: Splunk, QRadar, Sentinel, Chronicle
- **EDR**: CrowdStrike Falcon, SentinelOne, Carbon Black
- **SOAR**: Demisto/XSOAR, Phantom, Swimlane
- **Vulnerability Scanners**: Nessus, Qualys, Rapid7
- **Threat Intel Platforms**: MISP, ThreatConnect, Anomali
- **Forensics**: Volatility, FTK, EnCase, KAPE
- **Network Analysis**: Wireshark, tcpdump, Zeek/Bro

```dataview
TABLE 
  difficulty as "Level",
  role as "Relevant Roles",
  confidence as "Conf"
FROM "03_Technical/Security-Tools"
WHERE type = "interview-question"
SORT difficulty ASC
```

---

## 📋 Security Frameworks

**Core Topics:**
- **MITRE ATT&CK**: Tactics, Techniques, Procedures
- **NIST Cybersecurity Framework 2.0**: 6 Functions
- **NIST 800-53**: Security and privacy controls
- **NIST 800-61**: Incident Response
- **ISO 27001/27002**: Information security management
- **CIS Controls**: Critical security controls
- **OWASP Top 10**: Web application security
- **Cyber Kill Chain**: Lockheed Martin framework
- **Diamond Model**: Threat intelligence analysis

```dataview
TABLE 
  difficulty as "Level",
  role as "Relevant Roles",
  confidence as "Conf"
FROM "03_Technical/Frameworks"
WHERE type = "interview-question"
SORT difficulty ASC
```

---

## 💻 Security Scripting

**Core Topics:**
- **Python for Security**: 
  - Log analysis and parsing
  - API integration (VirusTotal, MISP, threat feeds)
  - Automation scripts
  - Web scraping for OSINT
  
- **PowerShell for Windows Security**:
  - Active Directory queries
  - Event log analysis
  - Security baseline configuration
  - Incident response automation
  
- **Bash for Linux Security**:
  - Log monitoring and alerting
  - System hardening scripts
  - Cron-based security checks
  - File system monitoring

```dataview
TABLE 
  difficulty as "Level",
  role as "Relevant Roles",
  confidence as "Conf"
FROM "03_Technical/Scripting"
WHERE type = "interview-question"
SORT difficulty ASC
```

---

## 🎯 Cross-Domain Questions

Some questions span multiple technical domains:

### Questions by Difficulty

#### Beginner (Foundation)
```dataview
TABLE 
  domain as "Domain",
  role as "Roles"
FROM "03_Technical"
WHERE type = "interview-question" AND difficulty = "beginner"
SORT file.name
LIMIT 20
```

#### Intermediate (Most Common)
```dataview
TABLE 
  domain as "Domain",
  role as "Roles"
FROM "03_Technical"
WHERE type = "interview-question" AND difficulty = "intermediate"
SORT domain, file.name
LIMIT 30
```

#### Advanced (Senior/Expert)
```dataview
TABLE 
  domain as "Domain",
  role as "Roles"
FROM "03_Technical"
WHERE type = "interview-question" AND difficulty = "advanced"
SORT domain, file.name
```

---

## 📚 Study Recommendations

### For SOC Analyst Interviews
**Priority Order:**
1. Network Security (protocols, IDS/IPS)
2. Security Tools (SIEM basics)
3. Endpoint Security (malware, EDR)
4. Frameworks (MITRE ATT&CK)

### For Security Engineer Interviews
**Priority Order:**
1. Cloud Security (AWS/Azure/GCP)
2. Security Tools (deployment and management)
3. Scripting (automation)
4. Network Security (architecture)

### For Incident Response Interviews
**Priority Order:**
1. Endpoint Security (forensics, malware analysis)
2. Frameworks (NIST 800-61)
3. Security Tools (forensics, memory analysis)
4. Network Security (traffic analysis)

---

## 🔗 Related MOCs
- [[MOC_Roles|👥 Browse by Role]]
- [[MOC_Scenarios|🎭 Scenario-Based Questions]]
- [[Home|🏠 Home]]

---
*Last Updated: 2025-01-15*
