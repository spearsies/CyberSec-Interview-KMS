---
type: flashcard-deck
domain: [analyst, forensics, ir]
tags:
  - flashcards
---

# ⚡ Windows & AD Detection (flashcard deck)

Hidden-answer drill cards — each line below is one card (prompt before the double colon, answer
after). Review with **Spaced Repetition → "Review flashcards from all notes"**. Uses `#flashcards`
(deck mode), not `#review`.
_Complements [[Atomic Cards - Analyst Fast Facts]] (which holds the core Event IDs 4624/4625/4688/4104/7045/4720 and Sysmon 1/3/8/11) — no cards are duplicated here._

## Logon Types (Event 4624/4625)
Logon Type 2::Interactive — logged on at the console
Logon Type 3::Network — SMB/file share, most remote auth
Logon Type 10::RemoteInteractive — RDP

## Windows Security Event IDs (extended)
Event ID 4634 / 4647::Account logoff
Event ID 4648::Logon using explicit credentials (runas — often lateral movement)
Event ID 4672::Special privileges assigned to new logon (admin/privileged logon)
Event ID 4728 / 4732::Member added to a global / local security group
Event ID 4769::Kerberos service ticket (TGS) requested — watch for RC4 (Kerberoasting)

## Sysmon Event IDs (extended)
Sysmon ID 7::Image / DLL loaded
Sysmon ID 10::ProcessAccess (e.g. suspicious LSASS access)
Sysmon ID 13::Registry value set
Sysmon ID 22::DNS query

## Kerberos abuses
Kerberoasting::Request a service (TGS) ticket and crack it offline
AS-REP roasting::Attack accounts with Kerberos pre-authentication disabled
Golden Ticket::Forged TGT signed with the KRBTGT account hash
Silver Ticket::Forged service ticket for one specific service
Pass-the-Ticket::Reuse a stolen Kerberos ticket

## LOLBins
certutil abuse::Download a file (-urlcache)
regsvr32 abuse::Run a remote scriptlet (AppLocker bypass)
mshta abuse::Execute a remote HTA
bitsadmin abuse::Download/execute via the BITS service

## 🔗 Related
- [[Windows Security Event IDs]]
- [[Sysmon]]
- [[Kerberos Authentication]]
- [[LOLBins]]
