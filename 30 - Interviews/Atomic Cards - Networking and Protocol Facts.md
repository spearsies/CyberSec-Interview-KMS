---
type: flashcard-deck
domain: [networking, analyst]
tags:
  - flashcards
---

# ⚡ Networking & Protocol Facts (flashcard deck)

Hidden-answer drill cards — each line below is one card (prompt before the double colon, answer
after). Review with **Spaced Repetition → "Review flashcards from all notes"**. Uses `#flashcards`
(deck mode), not `#review`.
_Complements [[Atomic Cards - Analyst Fast Facts]] (handshake, SYN-scan pattern, IDS vs IPS, common ports) — no cards are duplicated here._

## TCP control bits
TCP SYN::Initiate a connection (synchronize sequence numbers)
TCP ACK::Acknowledge received data
TCP FIN::Graceful connection close
TCP RST::Abort / reset the connection
TCP PSH::Push buffered data to the application immediately
TCP URG::Urgent pointer is set

## DNS record types
DNS A record::Maps a hostname to an IPv4 address
DNS AAAA record::Maps a hostname to an IPv6 address
DNS CNAME record::Alias from one name to another
DNS MX record::Mail exchange (mail server) for the domain
DNS TXT record::Arbitrary text (SPF/DKIM/verification) — abused for tunneling
DNS PTR record::Reverse lookup — IP address to hostname
DNS NS record::Delegates a zone to authoritative name servers

## TLS fingerprinting
JA3::Fingerprint of the TLS client hello (identifies client software)
JA3S::Fingerprint of the TLS server hello
JA4+::Modernized, more robust TLS fingerprint family
Why fingerprinting helps::Identifies malware TLS stacks without decrypting traffic

## 🔗 Related
- [[TCP Flags and Control Bits]]
- [[DNS Fundamentals]]
- [[JA3 and JA4 Fingerprinting]]
