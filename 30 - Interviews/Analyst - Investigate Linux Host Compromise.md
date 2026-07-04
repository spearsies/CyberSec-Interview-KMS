---
type: interview-question
question: "How do you investigate a possible compromise on a Linux host?"
domain: [analyst, ir, forensics]
role: [principal-analyst-l3, soc-analyst]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you investigate a possible compromise on a Linux host?

## Question
Same investigation, but on a Linux host — what logs, artifacts, and commands do you check?

> [!warning] Personal focus
> If your background is Windows-heavy, note that many JDs want **Windows *and* Linux**. Drill this one until it's as fluent as the Windows answer.

## Quick Answer
Same discipline as Windows — scope, then work through **authentication**, **process/network state**, **persistence**, and **integrity** — but with Linux artifacts: `auth.log`/`secure`, `auditd`, cron/systemd, SSH `authorized_keys`, and `/etc/passwd`–`/etc/shadow`.

## Detailed Answer
**1. Authentication & access**
- `/var/log/auth.log` (Debian/Ubuntu) or `/var/log/secure` (RHEL) — SSH logins, `sudo` use, new sessions. Watch for successful root SSH, sudo to root by odd users, spray patterns.
- `last`, `lastb` (failed), `w`, and the `wtmp`/`btmp` binaries.
- `auditd` logs (if configured) — `execve` calls, sensitive file access.

**2. Process & network state (live triage)**
- `ps auxf` — process tree; flag processes running from `/tmp`, `/dev/shm`, or world-writable paths.
- `ss -tulpn` / `netstat -tulpn` — unexpected listeners or outbound connections (reverse shells, C2).
- `lsof -p <pid>` / `lsof -i` — open files and sockets for a suspect process.
- High sustained CPU → possible crypto miner.

**3. Persistence — the Linux equivalents of Run keys/tasks**
- Cron: `/etc/crontab`, `/etc/cron.*`, and per-user `crontab -l`.
- systemd: rogue **services** and **timers** (`systemctl list-timers`, unit files in `/etc/systemd/system`).
- Shell profiles: `~/.bashrc`, `~/.bash_profile`, `/etc/profile.d/`.
- `/etc/rc.local`, init scripts.
- **SSH `authorized_keys`** — attacker-added public keys are a classic, quiet backdoor.
- Rootkit hooks: `/etc/ld.so.preload`, `LD_PRELOAD`.

**4. Integrity & accounts**
- `/etc/passwd` & `/etc/shadow` — new accounts or any **non-root account with UID 0**.
- SUID/SGID hunting: `find / -perm -4000 -type f 2>/dev/null`.
- Compare critical binaries' hashes to known-good; check timestamps with `stat` (watch for timestomping).

**5. History & artifacts**
- `~/.bash_history` (and whether it's been nulled/`unset HISTFILE` — evasion signal).
- Recently modified files: `find / -mtime -1`.

**6. Conclude.** Same as Windows: scope the blast radius, map to ATT&CK, contain (isolate/kill process/pull keys), and give the customer a clear timeline and remediation steps.

## Interview Delivery Tip
If asked something you're thinner on, answer with method: "I'd start at `auth.log` for the access story, pivot to running processes and listeners for live activity, then check cron, systemd, and `authorized_keys` for persistence." Structure signals competence even where hands-on reps are lighter.

## MITRE ATT&CK touchpoints
Persistence (T1053.003 Cron, T1543.002 systemd Service, T1098.004 SSH Authorized Keys), Priv-Esc (T1548.001 SUID), Defense Evasion (T1070.003 Clear History, T1014 Rootkit), Execution (T1059.004 Unix Shell).
