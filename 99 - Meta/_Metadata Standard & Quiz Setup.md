---
type: reference
tags: [meta, standard]
---

# 📐 Metadata Standard & Quiz Setup

The **single source of truth** for how notes are tagged. The command center and all quizzing
depend on it. One schema, no exceptions.

## The canonical frontmatter (interview-question notes)

```yaml
---
type: interview-question   # interview-question | concept | moc | reference | template | flashcard-deck
question: "One-line question text"   # what the dashboard shows you when drilling
domain: [analyst]          # controlled vocabulary below (list)
role: [soc-analyst]        # optional (list) — who this question is for
difficulty: medium         # easy | medium | hard   (always a WORD)
status: to-study           # to-study | reviewing | mastered
confidence: 1              # 1–5 self-rating
last_reviewed:             # YYYY-MM-DD
tags:
  - review                 # ← note-level Spaced Repetition picks this up
  - interview-question
---
```

## Controlled vocabulary
- **domain:** `networking`, `analyst`, `engineering`, `cloud`, `appsec`, `crypto`, `ir`, `threat-hunting`, `malware`, `forensics`, `behavioral`
- **role:** `soc-analyst`, `security-engineer`, `principal-analyst-l3`, `dfir`
- **difficulty:** `easy`, `medium`, `hard`
- **status:** `to-study`, `reviewing`, `mastered`

## 🎮 Quiz setup — two plugins, three drill modes

> [!important] The tag decides the mode
> Spaced Repetition has two review modes and they use **different tags**. Your rich Q&A notes use
> **note review** (`#review`); short atomic facts use **flashcard decks** (`#flashcards`). Don't
> mix both tags in one note.

### Plugin 1 · Dataview · the Command Center (browse-drill)
- Install Dataview, enable it, and turn ON "Enable JavaScript Queries."
- Open [[_Interview Prep — Command Center]]. It throws random questions at you, ranks your weak
  spots by confidence, and filters by domain. This is your **interview-rehearsal** layer.

### Plugin 2 · Spaced Repetition · memorization

**Mode A · Note review (use for your Q&A notes).** Whole note = one card; recall the full answer.
1. Note is tagged `#review` (the template already does this).
2. `Cmd/Ctrl+P` → **"Open Notes Review Queue in sidebar."**
3. Click a due note, read the question at top, recall out loud, scroll to check.
4. `Cmd/Ctrl+P` → **"Review note as Good / Easy / Hard"** (or the sidebar buttons). The plugin
   writes `sr-due` / `sr-interval` / `sr-ease` and schedules the next review.
- If the queue is empty: Settings → Spaced Repetition → "Tags to review notes" must include `#review`.

**Mode B · Flashcard decks (use for atomic facts — ports, Event IDs).** Hidden-answer cards.
1. Put cards in a note tagged `#flashcards` using `Term::Answer` per line (see
   [[Atomic Cards - Analyst Fast Facts]]).
2. `Cmd/Ctrl+P` → **"Review flashcards from all notes."** Front shows; click *Show Answer*; rate.

## The flow
`to-study` → drill in the Command Center + note-review queue → bump `confidence`, set
`status: reviewing`, update `last_reviewed` → once you answer cold, `status: mastered`.
