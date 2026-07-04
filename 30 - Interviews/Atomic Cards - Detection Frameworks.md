---
type: flashcard-deck
domain: [analyst, threat-hunting, engineering]
tags:
  - flashcards
---

# ⚡ Detection Frameworks (flashcard deck)

Hidden-answer drill cards — each line below is one card (prompt before the double colon, answer
after). Review with **Spaced Repetition → "Review flashcards from all notes"**. Uses `#flashcards`
(deck mode), not `#review`.

## MITRE ATT&CK
ATT&CK tactic::The adversary's goal / objective (e.g. Persistence, Lateral Movement)
ATT&CK technique::The method used to achieve a tactic, with an ID like T1059
ATT&CK sub-technique::A more specific variant of a technique (e.g. T1059.001 PowerShell)
ATT&CK Navigator::Tool for visualizing detection coverage as a heatmap

## Pyramid of Pain
Pyramid of Pain — bottom::Hash values — trivial for the adversary to change
Pyramid of Pain — middle::IPs, domains, network/host artifacts
Pyramid of Pain — top::TTPs — most painful for the adversary; build detections here

## Cyber Kill Chain
Cyber Kill Chain (7 stages)::Recon, Weaponize, Deliver, Exploit, Install, C2, Actions on Objectives
Kill Chain vs ATT&CK::Kill Chain is linear/sequential; ATT&CK is a non-linear behavior matrix

## Diamond Model
Diamond Model vertices::Adversary, Capability, Infrastructure, Victim
Diamond Model core method::Pivot from one known vertex to discover the others

## Indicators & rules
IOC::Artifact of a known/past compromise (hash, IP, domain, registry key)
IOA::Behavior/intent of an attack in progress (e.g. process injection, cred dumping)
Why IOAs beat IOCs::Behavior is harder to change than artifacts; IOCs decay quickly
Sigma::Open, vendor-agnostic YAML detection rule format ("YARA for logs")

## 🔗 Related
- [[MITRE ATT&CK]]
- [[Pyramid of Pain]]
- [[Cyber Kill Chain]]
- [[Diamond Model]]
- [[IOC vs IOA]]
- [[Sigma Rule Format]]
