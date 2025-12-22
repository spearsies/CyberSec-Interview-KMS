---

type: moc tags:

- moc
- dashboard

---

# 📊 Interview Prep Progress Dashboard

> **Last Updated:** `= date(today)`

## 🎯 Overall Progress

```dataviewjs
const questions = dv.pages('"02_Roles" or "03_Technical" or "04_Scenarios" or "05_Behavioral"')
  .where(q => q.type === "interview-question")
const total = questions.length
const mastered = questions.where(q => q.status === "mastered").length
const reviewing = questions.where(q => q.status === "reviewing").length
const learning = questions.where(q => q.status === "learning").length
const newQ = questions.where(q => q.status === "new").length

dv.paragraph(`**📚 Total Questions:** ${total}`)
dv.paragraph(`**✅ Mastered:** ${mastered} (${Math.round(mastered/total*100)}%)`)
dv.paragraph(`**🔄 Reviewing:** ${reviewing}`)
dv.paragraph(`**📖 Learning:** ${learning}`)
dv.paragraph(`**🆕 New:** ${newQ}`)

// Progress bar
const progress = Math.round(mastered/total*100)
const bar = "█".repeat(progress/5) + "░".repeat(20-progress/5)
dv.paragraph(`Progress: ${bar} ${progress}%`)
```

## 🔥 Questions Due Today

```dataview
TABLE 
  domain as "Domain",
  difficulty as "Level", 
  confidence as "Confidence",
  times_reviewed as "Reviews"
FROM "02_Roles" or "03_Technical" or "04_Scenarios" or "05_Behavioral"
WHERE type = "interview-question" 
  AND file.mtime <= date(today)
  AND status != "mastered"
SORT confidence ASC, times_reviewed ASC
LIMIT 15
```

## ⚠️ Low Confidence Areas (Priority Study)

```dataview
TABLE 
  role as "Role",
  domain as "Domain",
  times_reviewed as "Reviews",
  last_reviewed as "Last Review"
FROM "02_Roles" or "03_Technical"
WHERE confidence <= 2 
  AND type = "interview-question"
SORT confidence ASC, times_reviewed DESC
LIMIT 10
```

## 📈 Progress by Role

```dataview
TABLE WITHOUT ID
  role as "Role",
  length(rows) as "Total Questions",
  length(filter(rows, (r) => r.status = "mastered")) as "✅ Mastered",
  length(filter(rows, (r) => r.status = "learning")) as "📖 Learning",
  length(filter(rows, (r) => r.confidence <= 2)) as "⚠️ Low Confidence"
FROM "02_Roles"
WHERE type = "interview-question"
FLATTEN role
GROUP BY role
SORT role ASC
```

## 🔧 Progress by Technical Domain

```dataview
TABLE WITHOUT ID
  domain as "Domain",
  length(rows) as "Total",
  length(filter(rows, (r) => r.status = "mastered")) as "✅ Mastered",
  round(length(filter(rows, (r) => r.status = "mastered")) / length(rows) * 100, 0) + "%" as "% Complete"
FROM "03_Technical"
WHERE type = "interview-question"
FLATTEN domain
GROUP BY domain
SORT domain ASC
```

## 📅 Recent Study Activity

```dataview
TABLE 
  domain as "Domain",
  confidence as "Confidence",
  status as "Status"
FROM "02_Roles" or "03_Technical"
WHERE type = "interview-question" 
  AND last_reviewed
SORT last_reviewed DESC
LIMIT 10
```

## 🎯 This Week's Goals

- [ ] Complete 20 new questions
- [ ] Review all low-confidence (<3) questions
- [ ] Practice 3 scenario walkthroughs
- [ ] Conduct 1 mock interview
- [ ] Update confidence ratings after practice

## 📝 Recent Interviews

```dataview
TABLE 
  company as "Company",
  role as "Role",
  date as "Date",
  outcome as "Outcome"
FROM "07_Interview-Logs"
WHERE type = "interview-log"
SORT date DESC
LIMIT 5
```

## 🎲 Recommended Study Session (Random Selection)

```dataview
TABLE 
  domain as "Domain",
  difficulty as "Difficulty"
FROM "02_Roles" or "03_Technical"
WHERE type = "interview-question" 
  AND confidence <= 3
  AND status != "mastered"
SORT file.name
LIMIT 10
```

---

## 📊 Study Streaks & Statistics

**Current Study Streak:** _Track manually or use Calendar plugin_ **Questions Reviewed This Week:** **Average Confidence Score:**

```dataviewjs
const questions = dv.pages('"02_Roles" or "03_Technical"')
  .where(q => q.type === "interview-question" && q.confidence)
const avgConfidence = questions.array()
  .reduce((sum, q) => sum + q.confidence, 0) / questions.length
dv.paragraph(`**Average Confidence:** ${avgConfidence.toFixed(2)}/5.0`)
```

---

_Return to [[Home]]_