---
type: flashcard-deck
domain: [analyst, forensics, networking]
tags:
  - flashcards
---

# ⚡ Analyst Fast Facts (flashcard deck)

Hidden-answer drill cards — each line below is one card (prompt before the double colon, answer
after). Review with **Spaced Repetition → "Review flashcards from all notes"**; the front shows,
the answer hides until you click *Show Answer*. This note uses `#flashcards` (deck mode), NOT
`#review` (note mode).

## Windows Event IDs
Event ID 4624::Successful logon — check Logon Type (3 = network, 10 = RDP)
Event ID 4625::Failed logon — brute force / password spray
Event ID 4688::Process creation (with command line, if audited)
Event ID 4104::PowerShell script block logging — deobfuscated scripts
Event ID 7045::Service install — common persistence
Event ID 4720::New user account created

## Sysmon Event IDs
Sysmon ID 1::Process creation — command line + hashes
Sysmon ID 3::Network connection
Sysmon ID 8::CreateRemoteThread — process injection
Sysmon ID 11::File create

## Common ports
RDP port::3389/TCP
SMB port::445/TCP
DNS port::53 (UDP/TCP)
LDAP / LDAPS port::389 / 636
Kerberos port::88

## Networking quick recall
TCP 3-way handshake::SYN → SYN-ACK → ACK
SYN scan pattern::SYN → SYN-ACK → RST (never completes)
IDS vs IPS::IDS detects & alerts (out-of-band); IPS blocks inline
