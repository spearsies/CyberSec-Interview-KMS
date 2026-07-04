---
type: concept
tags: [theme/detection]
---

# Sigma Rule Format

## Overview
Sigma is an open, vendor-agnostic YAML format for SIEM detection rules — the "YARA of logs." Write the logic once and convert it to any backend (Splunk SPL, KQL, Elastic) with pySigma/sigmac.

## Key details
- Core fields: `logsource`, `detection` (selection + `condition`), `level`, and ATT&CK `tags`.
- Converted/compiled to the target platform's query language via backends and pipelines.
- Shared through the SigmaHQ community repository.
- Caveat: field mappings and backend limits mean you still test the converted output.

## 🔗 Related
- [[DetectionEng - Writing Portable Rules with Sigma]]
- [[DetectionEng - What Is Detection-as-Code]]
