---
type: moc
cssclasses: [dashboard]
tags: [dashboard]
---

# 🛡️ Cybersecurity KMS — Home

## 🧭 Start here
- [[_Interview Prep — Command Center|🎯 Interview Prep Command Center]] — quiz yourself
- [[_Metadata Standard & Quiz Setup|📐 Metadata Standard & Quiz Setup]] — how notes are tagged

## 📊 Quick status
```dataview
TABLE length(rows) AS "Questions"
FROM "30 - Interviews"
WHERE type = "interview-question"
GROUP BY status AS "Status"
```

## 🕐 Recently worked on
```dataview
TABLE domain AS "Domain", status AS "Status"
FROM "30 - Interviews"
WHERE type = "interview-question"
SORT file.mtime DESC
LIMIT 5
```

## 🔑 Key concepts
```dataview
LIST
FROM "20 - Key Concepts"
WHERE type = "concept"
SORT file.name ASC
```
