---
type: moc
tags: [dashboard]
cssclasses: [dashboard]
---

# 🎯 Interview Prep — Command Center

Your quiz engine. Every block below reads live from your question notes in `30 - Interviews`.
Requires the **Dataview** plugin (see [[_Metadata Standard & Quiz Setup]]).

---

## 🎲 Random Drill — answer these cold
_Five random questions you haven't mastered. Read the question, answer out loud, THEN open the note to check. (Needs "Enable JavaScript Queries" in Dataview settings.)_

```dataviewjs
const pool = dv.pages('"30 - Interviews"')
  .where(p => p.type == "interview-question" && p.status != "mastered");
if (!pool.length) {
  dv.paragraph("_No unmastered questions found yet — add some with the template._");
} else {
  const pick = pool.sort(() => Math.random() - 0.5).slice(0, 5);
  for (const p of pick) {
    dv.header(4, "❓ " + (p.question || p.file.name));
    dv.paragraph(`${p.domain ? p.domain : "—"} · **${p.difficulty}** · confidence ${p.confidence ?? "?"}/5 — [[${p.file.name}|reveal answer]]`);
  }
}
```

> [!tip] Re-roll
> Click off the note and back on (or edit → preview) to shuffle a fresh five.

---

## 📊 Progress at a glance
```dataview
TABLE length(rows) AS "Questions"
FROM "30 - Interviews"
WHERE type = "interview-question"
GROUP BY status AS "Status"
```

## 🛡️ Weakest areas — drill these first
_Unmastered questions, lowest confidence first._
```dataview
TABLE domain AS "Domain", difficulty AS "Difficulty", confidence AS "Conf", status AS "Status"
FROM "30 - Interviews"
WHERE type = "interview-question" AND status != "mastered"
SORT confidence ASC
LIMIT 15
```

---

## 🗂️ Drill by domain
_Filter to one topic before a targeted interview (e.g. analyst vs. engineering)._
```dataview
TABLE difficulty AS "Difficulty", status AS "Status", confidence AS "Conf"
FROM "30 - Interviews"
WHERE type = "interview-question"
GROUP BY domain AS "Domain"
```

## ⏰ Stale — not reviewed in 14+ days
```dataview
TABLE last_reviewed AS "Last reviewed", status AS "Status"
FROM "30 - Interviews"
WHERE type = "interview-question" AND status != "mastered"
  AND (!last_reviewed OR last_reviewed <= date(today) - dur(14 days))
SORT last_reviewed ASC
```

## 🏆 Mastered — hall of fame
```dataview
TABLE domain AS "Domain", difficulty AS "Difficulty"
FROM "30 - Interviews"
WHERE type = "interview-question" AND status = "mastered"
SORT domain ASC
```
