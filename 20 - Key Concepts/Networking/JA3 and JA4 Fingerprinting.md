---
type: concept
tags: [theme/networking]
---

# JA3 and JA4 Fingerprinting

## Overview
JA3/JA3S and the newer **JA4+** fingerprint the TLS handshake — cipher suites, extensions, and versions — into a hash that identifies the *client software*, even though the payload is encrypted.

## Key details
- JA3 = client hello fingerprint; JA3S = server hello; JA4+ = a modernized, more robust family.
- Lets you spot malware TLS stacks (e.g. Cobalt Strike) without decryption.
- Combine with SNI, certificate details, and connection timing for beacon hunting.
- Caveat: shared libraries produce shared fingerprints — corroborate before alerting.

## 🔗 Related
- [[ThreatHunt - Detecting C2 Beaconing]]
