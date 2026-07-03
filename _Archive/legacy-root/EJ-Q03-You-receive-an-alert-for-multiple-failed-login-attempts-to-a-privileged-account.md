```
---
status: "To Study" # Options: "To Study", "Reviewing", "Mastered"
domain: ["Analyst"] # Options: "Analyst", "Engineering", "Cloud", "AppSec"
difficulty: 2 # Options: 1, 2, 3
tags: [interview, security]
last_reviewed: 2023-10-27
---
```

# Question: You receive an alert for multiple failed login attempts to a privileged account. Walk me through your investigation

## Why it's asked

Employers want to gauge:

- Authentication attack understanding
- Windows/Active Directory knowledge
- SIEM query proficiency
- Privilege escalation awareness
- Scope determination skills
- Containment decision-making
- Risk assessment abilities

## Sample Response

> This is high priority due to privileged account targeting. Here's my approach:

**Immediate Context (5 minutes):**

- Account name and privilege level (domain admin, local admin, service account?)
- Number of failed attempts and timeframe
- Source IPs or systems
- Whether account is currently in legitimate use
- Account lockout status

**SIEM Investigation:**

```splunk
index=windows EventCode=4625 Account_Name="[account]"
| stats count by Source_Network_Address, Logon_Type, Workstation_Name
| sort -count
```

Looking for:

- **Logon Type:** Type 3 (network), Type 10 (RDP), Type 2 (interactive)
- **Source patterns:** Single IP vs distributed, internal vs external
- **Timing:** Rapid attempts (automated) vs spaced (manual)
- **Failure reasons:** Wrong password vs account disabled

**Expand Scope:**  
Check for successful login after failures:

```splunk
index=windows (EventCode=4624 OR EventCode=4625) Account_Name="[account]"
| timechart span=1m count by EventCode
```

Look for other accounts targeted from same source:

```splunk
index=windows EventCode=4625 Source_Network_Address="[IP]"
| stats count by Account_Name
```

**Pattern Analysis:**

- **Password Spray:** Many accounts, few attempts each
- **Brute Force:** One account, many rapid attempts
- **Credential Stuffing:** Valid usernames with password lists

**Escalation Decisions:**

**Immediate Escalation if:**

- Any successful login to privileged account from suspicious source
- Evidence of lateral movement
- Multiple privileged accounts targeted
- Indicators of active compromise

**Containment Actions:**

- Disable compromised account
- Reset credentials
- Block source IPs at firewall
- Revoke active sessions
- Enhanced monitoring

**Example:**  
Investigated 50 failed logins to domain admin account from external IP in 10 minutes. Pattern matched password spray attack (3 attempts per account across 20 accounts). No successful authentications detected. Blocked source IP, forced password resets for targeted accounts, implemented MFA requirement for privileged accounts. Created detection rule for similar patterns.

## Key Technical Talking Points

- ==**Event IDs:** 4625 (failed), 4624 (success), 4740 (lockout), 4768/4769 (Kerberos)==
- **Attack patterns:** Brute force, password spray, credential stuffing
- **Context matters:** Logon type, source location, timing, account type
- **Scope expansion:** Check for success, other targeted accounts, lateral movement
- **Containment:** Disable account, reset credentials, block IPs, revoke sessions
- **Prevention:** MFA, conditional access, monitoring improvements
- **Documentation:** Timeline, IOCs, pattern analysis, response actions

## Related Concepts

- [Windows Event Log Analysis](app://obsidian.md/Windows%20Event%20Log%20Analysis)
- [Authentication Attacks](app://obsidian.md/Authentication%20Attacks)
- [Password Spray Detection](app://obsidian.md/Password%20Spray%20Detection)
- [Privileged Account Security](app://obsidian.md/Privileged%20Account%20Security)
- [Lateral Movement Detection](app://obsidian.md/Lateral%20Movement%20Detection)
- [Active Directory Security](app://obsidian.md/Active%20Directory%20Security)
- [Credential-based Attacks](app://obsidian.md/Credential-based%20Attacks)