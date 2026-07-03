# 📊 Interview Prep Command Center

## 🎯 Progress Overview

This table tracks your mastery across the entire question bank.

```
TABLE status as "Status", domain as "Domain", difficulty as "Difficulty"
FROM "01_Question_Bank"
WHERE status != "Mastered"
SORT difficulty DESC
```

## 🛠️ Engineering Track: To Study

Questions tagged with `#Engineering` that are currently marked as `🔴 To Study`.

```
LIST
FROM "01_Question_Bank"
WHERE contains(domain, "Engineering") AND status = "To Study"
```

## 🔍 Analyst Track: Needs Review

Questions tagged with `#Analyst` that you've started but haven't mastered yet.

```
LIST
FROM "01_Question_Bank"
WHERE contains(domain, "Analyst") AND status = "Reviewing"
```

## 🏆 Mastered Questions

A hall of fame for the concepts you've nailed.

```
TABLE domain as "Domain"
FROM "01_Question_Bank"
WHERE status = "Mastered"
```

## 📅 Recently Updated

The last 5 notes you've worked on. Use this to pick up where you left off.

```
LIST
FROM "01_Question_Bank"
SORT file.mday DESC
LIMIT 5
```