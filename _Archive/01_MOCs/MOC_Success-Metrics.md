---
type: moc
tags:
  - moc
  - metrics
  - success
---

# 📈 Success Metrics

Define and track success metrics for interview preparation effectiveness and KMS health.
See [GitHub Issue #20](https://github.com/spearsies/CyberSec-Interview-KMS/issues/20) for targets.

---

## 🏆 KMS Health Targets

| Metric | Target | Description |
|--------|--------|-------------|
| Total Questions | 200+ | High-quality, non-redundant questions in the vault |
| Relational Density | ≥ 3 links/question | Each question links to ≥ 3 technical concept notes |
| Active Contributors | 10+ | Unique contributors on GitHub |

---

## 📚 Vault Size — Question Count

```dataviewjs
const questions = dv.pages('"02_Roles" or "03_Technical" or "04_Scenarios" or "05_Behavioral"')
  .where(q => q.type === "interview-question")
const total = questions.length
const target = 200
const pct = Math.min(Math.round(total / target * 100), 100)
const filled = Math.round(pct / 5)
const bar = "█".repeat(filled) + "░".repeat(20 - filled)
dv.paragraph(`**Total Questions:** ${total} / ${target}  ${bar}  ${pct}%`)
if (total >= target) {
  dv.paragraph("✅ **Target met!**")
} else {
  dv.paragraph(`⚠️ Need **${target - total}** more questions to hit the 200+ target.`)
}
```

---

## 🔗 Relational Density — Low-Link Questions

Questions with fewer than 3 outgoing links need additional concept connections.

```dataview
TABLE
  file.outlinks as "Outgoing Links",
  domain as "Domain",
  difficulty as "Level"
FROM "02_Roles" OR "03_Technical" OR "04_Scenarios" OR "05_Behavioral"
WHERE type = "interview-question"
  AND length(file.outlinks) < 3
SORT length(file.outlinks) ASC, file.folder ASC
LIMIT 25
```

---

## 📊 Personal Effectiveness — Overall Mastery

```dataviewjs
const questions = dv.pages('"02_Roles" or "03_Technical" or "04_Scenarios" or "05_Behavioral"')
  .where(q => q.type === "interview-question")
const total = questions.length
if (total === 0) { dv.paragraph("No questions found yet."); return }

const mastered  = questions.where(q => q.status === "mastered").length
const reviewing = questions.where(q => q.status === "reviewing").length
const learning  = questions.where(q => q.status === "learning").length
const newQ      = questions.where(q => q.status === "new").length
const avgConf   = questions.array().reduce((s, q) => s + (q.confidence || 0), 0) / total

const pct    = Math.round(mastered / total * 100)
const filled = Math.round(pct / 5)
const bar    = "█".repeat(filled) + "░".repeat(20 - filled)

dv.paragraph(`**📚 Total:** ${total}  |  **✅ Mastered:** ${mastered} (${pct}%)  |  **🔄 Reviewing:** ${reviewing}  |  **📖 Learning:** ${learning}  |  **🆕 New:** ${newQ}`)
dv.paragraph(`**Mastery Progress:** ${bar} ${pct}%`)
dv.paragraph(`**⭐ Average Confidence:** ${avgConf.toFixed(2)} / 5.0`)
```

---

## 📈 Mastery by Technical Domain

```dataview
TABLE WITHOUT ID
  domain as "Domain",
  length(rows) as "Total",
  length(filter(rows, (r) => r.status = "mastered")) as "✅ Mastered",
  round(length(filter(rows, (r) => r.status = "mastered")) / length(rows) * 100, 0) + "%" as "% Done",
  round(sum(filter(rows, (r) => r.confidence)) / length(rows), 1) as "Avg Conf"
FROM "03_Technical"
WHERE type = "interview-question"
FLATTEN domain
GROUP BY domain
SORT domain ASC
```

---

## 🎭 Mastery by Role

```dataview
TABLE WITHOUT ID
  role as "Role",
  length(rows) as "Total",
  length(filter(rows, (r) => r.status = "mastered")) as "✅ Mastered",
  round(length(filter(rows, (r) => r.status = "mastered")) / length(rows) * 100, 0) + "%" as "% Done",
  length(filter(rows, (r) => r.confidence <= 2)) as "⚠️ Low Conf"
FROM "02_Roles"
WHERE type = "interview-question"
FLATTEN role
GROUP BY role
SORT role ASC
```

---

## 🏅 Interview Outcomes

```dataviewjs
const logs    = dv.pages('"07_Interview-Logs"').where(l => l.type === "interview-log")
const total   = logs.length
const passed  = logs.where(l => l.outcome === "passed").length
const offers  = logs.where(l => l.outcome === "offer").length
const failed  = logs.where(l => l.outcome === "failed").length
const pending = logs.where(l => l.outcome === "pending").length

if (total === 0) {
  dv.paragraph("No interview logs yet — add one after each interview using the `TI_Interview-Log` template.")
} else {
  const successRate = Math.round((passed + offers) / total * 100)
  dv.paragraph(`**Total Interviews Logged:** ${total}`)
  dv.paragraph(`**✅ Passed / Offers:** ${passed + offers}  |  **❌ Failed:** ${failed}  |  **⏳ Pending:** ${pending}`)
  dv.paragraph(`**Success Rate:** ${successRate}%`)
}
```

```dataview
TABLE
  company as "Company",
  role as "Role",
  date as "Date",
  outcome as "Outcome",
  confidence_going_in as "Conf In"
FROM "07_Interview-Logs"
WHERE type = "interview-log"
SORT date DESC
LIMIT 10
```

---

## ⚠️ Priority Study — Low Confidence (≤ 2)

```dataview
TABLE
  domain as "Domain",
  difficulty as "Level",
  confidence as "Conf",
  times_reviewed as "Reviews",
  last_reviewed as "Last Review"
FROM "02_Roles" OR "03_Technical"
WHERE type = "interview-question" AND confidence <= 2
SORT confidence ASC, last_reviewed ASC
LIMIT 15
```

---

## 🎯 Milestones

| Milestone | Target | Notes |
|-----------|--------|-------|
| Vault foundation | 50 questions | All templates in place |
| First domain covered | 1 domain × 20 questions | Focus on highest-priority role |
| First interview pass | 1 pass | Track in `07_Interview-Logs` |
| Half-way mark | 100 questions mastered | Confidence avg ≥ 3.0 |
| First offer | 1 offer | Update interview log outcome |
| Quantity target | 200+ questions in vault | Per GitHub Issue #20 |
| Relational density | 0 questions with < 3 links | Resolved via Low-Link table above |
| Full coverage | All domains ≥ 50% mastered | Domain table above |

---

## 🔗 Related

- [[Dashboard_Progress|📊 Progress Dashboard]]
- [[Home|🏠 Home]]
- [[MOC_Roles|👥 Browse by Role]]
- [[MOC_Technical-Domains|🔧 Browse by Domain]]
