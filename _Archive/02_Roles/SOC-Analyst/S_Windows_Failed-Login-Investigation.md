---
title: "Scenario: Multiple Failed Login Attempts"
type: interview-question
created: 2025-01-15
modified: 2025-01-15

# Classification
domain: [incident-response, windows-security]
role: [soc-analyst]
difficulty: intermediate
question_type: scenario

# Progress Tracking
confidence: 1
times_reviewed: 0
last_reviewed: 
status: new

# Spaced Repetition
sr-due: 2025-01-15
sr-interval: 1
sr-ease: 250

# Context
company_asked: [Edward Jones]
source: "Common SOC Tier 1/2 scenario question"
tags:
  - flashcard
  - interview-question
  - scenario/investigation
  - windows
  - tier1
  - tier2
---
```
---
status: "To Study" # Options: "To Study", "Reviewing", "Mastered"
domain: ["Analyst"] # Options: "Analyst", "Engineering", "Cloud", "AppSec"
difficulty: 2 # Options: 1, 2, 3
tags: [interview, security]
last_reviewed: 2023-10-27
---
```
## Question
**Scenario:** Your SIEM alerts you to over 2,000 failed login attempts (Windows Event ID 4625) from IP address 192.168.10.50 against Domain Controller DC01 within a 5-minute window. The attempts target the Administrator account.

**Walk me through your investigation and response.**

## Quick Answer
This is a **brute force attack**. Immediate actions: Verify alert legitimacy → Check if account locked → Investigate source IP → Block if malicious → Check for successful logins → Document and escalate if needed.

## Detailed Answer

### Step-by-Step Investigation:

#### 1. **Initial Alert Verification** (First 2 minutes)
```
✓ Confirm Event ID 4625 = Failed Logon
✓ Verify source: Single IP (192.168.10.50) or distributed?
✓ Time frame: 2000+ attempts in 5 minutes = ~6-7 attempts/second
✓ Target: Domain Administrator account (HIGH SEVERITY)
```

**Critical Question:** Is this internal (192.168.x.x) or external IP?

#### 2. **Immediate Triage Questions**
- **Account Status:** Is Administrator account locked? (Event ID 4740)
- **Success Indicator:** Were ANY login attempts successful? (Event ID 4624)
- **Source Identification:** What is 192.168.10.50?
  - Run WHOIS/internal IP database lookup
  - Check CMDB for hostname
  - Verify if it's a legitimate system

#### 3. **SIEM Query to Gather Context**

**Splunk Query Example:**
```spl
index=windows EventCode=4625 OR EventCode=4624 OR EventCode=4740
  Workstation_Name="DC01" 
  Source_Network_Address="192.168.10.50"
| stats count by EventCode, Account_Name, Source_Network_Address
| sort -count
```

**What to Look For:**
- Total failed attempts per account
- If any Event ID 4624 (successful logon) occurred
- If Event ID 4740 (account lockout) triggered
- Other accounts targeted
- Timeline of activity

#### 4. **Source Investigation**

**If Internal IP:**
- Identify system/user: `nslookup 192.168.10.50`
- Check if system is:
  - Compromised (malware/bot)
  - Misconfigured service/application
  - Legitimate admin testing (contact owner!)
  
**If External IP (VPN/RDP exposure):**
- **CRITICAL:** External brute force on domain admin = HIGH SEVERITY
- Block immediately at firewall
- Check threat intelligence feeds (AbuseIPDB, VirusTotal)

#### 5. **Containment Actions**

**Immediate (Within minutes):**
- [ ] Block source IP at firewall if malicious
- [ ] Verify Administrator account isn't locked (prevents legit admin access)
- [ ] Check for successful logins from that IP

**Short-term (15-30 minutes):**
- [ ] Review other DCs for same pattern
- [ ] Check for privilege escalation attempts
- [ ] Verify account lockout policies are working
- [ ] Alert IT Security team

#### 6. **Evidence Collection**

Document everything for incident report:
- SIEM query results (export)
- Timeline of events
- Source IP investigation findings
- Actions taken and by whom
- Screenshot of alert

#### 7. **Post-Incident Recommendations**

**Prevent Future Occurrences:**
- ✅ Implement account lockout policy (if not present)
- ✅ Enable MFA for administrator accounts
- ✅ Restrict Administrator account usage (use separate admin accounts)
- ✅ Implement rate limiting on authentication services
- ✅ Deploy honeypot accounts to detect attacks
- ✅ Geo-blocking if attacks are international

## Interview Tips

### How to Structure Your Answer:
1. **Stay calm and methodical** - Interviewers test your process, not speed
2. **Ask clarifying questions**: 
   - "Is this internal or external traffic?"
   - "Do we have MFA enabled on admin accounts?"
   - "What's our current account lockout policy?"
3. **Think out loud** - Show your reasoning process
4. **Mention tools**: SIEM, EDR, firewall, Active Directory

### Red Flags to Avoid:
❌ Immediately blocking without investigation (could be false positive)
❌ Forgetting to check for successful logins
❌ Not documenting actions
❌ Failing to escalate high-severity incidents

### Advanced Discussion Points:
- **Password spray vs. brute force**: This is brute force (many attempts, single account). Password spray = one password, many accounts
- **Detection evasion**: Attackers may slow down to avoid thresholds
- **Lateral movement**: If successful, attacker likely pivots to other systems

### Example Verbal Response:
> "First, I'd verify this is a legitimate alert by checking the SIEM for Event ID 4625 details. With 2000+ failed attempts in 5 minutes against the Administrator account, this is clearly a brute force attack. My immediate priority is determining if any attempts succeeded by looking for Event ID 4624, and whether the account is now locked out using Event ID 4740.
> 
> Next, I'd investigate the source IP. If it's internal at 192.168.10.50, I'd look up what system that is - it could be compromised or a misconfigured service. If external, this is critical and requires immediate blocking at the firewall.
> 
> I'd run additional SIEM queries to check if other accounts or Domain Controllers are targeted, document all findings, and escalate to Tier 2 if successful authentication occurred. Finally, I'd recommend implementing MFA and reviewing our lockout policies to prevent future incidents."

## Related Concepts
- [[Q_Windows_Event-IDs]]
- [[C_Brute-Force-vs-Password-Spray]]
- [[Q_SOC_Alert-Triage-Process]]
- [[C_Active-Directory-Security]]
- [[Q_SIEM_SPL-Queries]]

## Flashcard
Windows Event ID 4625::Failed logon attempt
Windows Event ID 4624::Successful logon
Windows Event ID 4740::Account locked out
Brute force vs password spray::Brute force: many attempts on single account. Password spray: one password across many accounts.
