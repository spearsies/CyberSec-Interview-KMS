---
type: reference
tags: [meta, standard]
---

# 📐 Metadata Standard & Quiz Setup

This is the **single source of truth** for how every interview-question note is tagged.
The command center and all quizzing depend on every note following it. One schema, no exceptions.

## The canonical frontmatter

```yaml
---
type: interview-question   # interview-question | concept | moc | reference | template
question: "One-line question text"   # what the dashboard shows you when drilling
domain: [analyst]          # see controlled vocabulary below (list)
role: [soc-analyst]        # optional (list) — who this question is for
difficulty: medium         # easy | medium | hard   (always a WORD, never a number)
status: to-study           # to-study | reviewing | mastered
confidence: 1              # 1–5 self-rating (1 = shaky, 5 = nailed it)
last_reviewed:             # YYYY-MM-DD — set this each time you drill the note
tags:
  - flashcard              # lets the Spaced Repetition plugin pick it up
  - interview-question
---
```

## Controlled vocabulary (pick from these — don't invent per-note)
- **domain:** `networking`, `analyst`, `engineering`, `cloud`, `appsec`, `crypto`, `ir`, `threat-hunting`, `malware`, `forensics`, `behavioral`
- **role:** `soc-analyst`, `security-engineer`, `principal-analyst-l3`, `dfir`
- **difficulty:** `easy`, `medium`, `hard`
- **status:** `to-study` (haven't got it), `reviewing` (in progress), `mastered` (done)

> [!tip] Why words, not numbers, for difficulty
> Every existing note already used words. Standardizing on words means no rewrite of your
> content — and the dashboard groups by difficulty rather than sorting, so ordering doesn't matter.

## 🎮 Quiz setup — two plugins, five minutes

Your `status` / `confidence` / `last_reviewed` fields power **browsing-style drilling** (Dataview).
The `flashcard` tag powers **spaced-repetition memorization** (Spaced Repetition plugin). Install both.

### 1. Dataview (powers the Command Center)
- Settings → Community plugins → Browse → **Dataview** → Install → Enable.
- In Dataview settings, turn **ON** "Enable JavaScript Queries" (the random-drill block needs it).
- That's it — [[_Interview Prep — Command Center]] now works.

### 2. Spaced Repetition (powers flashcard drilling)
- Community plugins → Browse → **Spaced Repetition** (by Stephen Mwangi) → Install → Enable.
- It reviews any note tagged `#flashcard` as a whole-note card and schedules it, writing its own
  `sr-due` / `sr-interval` / `sr-ease` fields — you don't hand-edit those.
- Open the command palette → "Spaced Repetition: Review flashcards" to start a session.
- Optional: in its settings you can also treat each folder as a "deck," so you can drill just
  `30 - Interviews/Analyst QA` before an analyst interview.

## How a note flows through the system
`to-study` → you drill it in the Command Center → bump `confidence`, set `status: reviewing`,
update `last_reviewed` → once you can answer cold, `status: mastered`. The dashboard shows what's
left, what's weak, and throws random questions at you like an interviewer would.
