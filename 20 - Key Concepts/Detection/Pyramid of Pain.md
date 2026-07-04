---
type: concept
tags: [theme/detection]
---

# Pyramid of Pain

## Overview
David Bianco's model ranking indicator types by how much *pain* it causes an adversary when you reliably deny them. Detections built on the higher tiers are far more durable than those built on the bottom.

## The tiers (bottom → top)
- **Hash values** — trivial for the adversary to change.
- **IP addresses** — easy.
- **Domain names** — simple.
- **Network/host artifacts** — annoying.
- **Tools** — challenging.
- **TTPs** — tough; this is where you want your detections.

## 🔗 Related
- [[Analyst - What Makes a Good Detection Rule]]
- [[IOC vs IOA]]
- [[MITRE ATT&CK]]
