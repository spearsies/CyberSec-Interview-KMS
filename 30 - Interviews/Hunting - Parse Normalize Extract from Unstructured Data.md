---
type: interview-question
question: "How do you parse, normalize, and extract actionable intelligence from unstructured network and log data to find hidden adversaries?"
domain: [threat-hunting, analyst]
role: [principal-analyst-l3, soc-analyst, dfir]
difficulty: hard
status: to-study
confidence: 1
last_reviewed:
tags:
  - review
  - interview-question
---

# ❓ How do you parse, normalize, and extract actionable intelligence out of unstructured network and log data to locate hidden adversaries?

## ✅ Quick Answer
Turn messy multi-source data into something correlatable, then hunt behaviors in it. **Parse** raw logs into fields → **normalize** to a common schema so an IP or user means the same thing everywhere → **enrich** with intel/asset/identity context → **extract** signal via frequency analysis, baselining, and pivoting. Confirmed finding goes to IR; a gap becomes a new detection so the hunt runs itself next time.

## 🗣️ Walk-through — the data pipeline

**1. Parse (raw → fields).** Firewall, proxy, DNS, EDR, syslog, PCAP, JSON/CSV/free-text all arrive differently. Extract fields with regex/grok, Splunk `rex`/`spath`, or KQL `parse`. Python (pandas) for offline/bulk parsing and dedup.

**2. Normalize (fields → common model).** Map disparate schemas to a **common data model** — Splunk **CIM**, Elastic **ECS**, Sentinel **ASIM**, or **OSSEM**. Standardize timestamps to UTC, unify field names (`src_ip`, `user`), so you can correlate endpoint + network + identity in one query. This step is what makes cross-source hunting possible.

**3. Enrich.** Add threat-intel reputation, GeoIP/ASN/WHOIS, asset criticality, user/role context, and **ATT&CK technique tags**. Enrichment turns a raw IOC into a prioritized lead.

**4. Extract actionable intel (the hunt itself).**
- **Stack counting / frequency analysis** — rare is suspicious; evil hides in the long tail (rare command lines, rare parent-child pairs).
- **Baseline then outliers** — beacon timing (low jitter), first-seen domains, unusual user-agents, off-hours auth, data-volume spikes.
- **Pivot across normalized fields** — suspect IP → hosts that talked to it → processes → users.
- **Behavioral patterns** — beaconing, DGA/DNS tunneling (entropy, query length/volume), lateral movement, UEBA-style anomalies.

**5. Close the loop.** Malicious → IR. Benign but a visibility/detection gap → write a **Sigma/analytic** so it's automated. Document hypothesis → data → method → result. Hunt on **TTPs over atomic IOCs** (Pyramid of Pain).

## 💡 Tooling to name-drop
SIEM query (Splunk SPL, Sentinel KQL), Python + pandas + Jupyter for parsing/normalization/enrichment, regex/grok, a TIP for IOC enrichment, and a common data model (CIM/ECS/ASIM).

## ⚠️ Follow-ups
- "How do you find beaconing?" → group by src/dest, look at consistent inter-packet time deltas / low jitter; IO graph.
- "How do you avoid drowning in false positives?" → baseline first, stack-rank rarity, enrich before alerting, tune iteratively.

## 🗣️ Personal anchor
Tie to building CTI and threat-hunting programs from scratch — defining intel requirements, then operationalizing hunts into detections.

## 🔗 Related
- [[SIEM - Log Analysis End to End]]
