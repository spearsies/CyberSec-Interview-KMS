# 🛡️ Cybersecurity Interview KMS

An Obsidian vault for studying and drilling cybersecurity interview questions. It doubles as a
quiz engine: tag every question with one standard schema, and dashboards throw questions at you,
track what's weak, and schedule spaced-repetition review.

## Structure
```
10 - MOCs/          Dashboards & maps of content (start at 00 - Home Dashboard)
20 - Key Concepts/  Atomic technical notes (Networking, Cryptography, ...)
30 - Interviews/    The question bank + Interview Prep Command Center
99 - Meta/          Templates + the Metadata Standard & Quiz Setup guide
```

## Getting started
1. Install the **Dataview** and **Spaced Repetition** community plugins.
2. Read `99 - Meta/_Metadata Standard & Quiz Setup.md` — it defines the one schema every note uses.
3. Open `30 - Interviews/_Interview Prep — Command Center.md` to drill yourself.
4. Add new questions with `99 - Meta/Templates/Template - Interview Question.md`.

## How quizzing works
- **Browse-drill:** the Command Center pulls random unmastered questions, surfaces your weakest
  areas by confidence, and lets you filter by domain before a targeted interview.
- **Spaced repetition:** notes tagged `#flashcard` are scheduled by the Spaced Repetition plugin
  for long-term memorization.
- Update each note's `status`, `confidence`, and `last_reviewed` as you go; the dashboards react.

## The one rule
Every question note follows the canonical frontmatter in the Metadata Standard. Consistency is
what makes the dashboards work — one schema, no exceptions.
