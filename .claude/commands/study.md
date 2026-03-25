---
description: Generate a study guide with concepts to understand, curated reading list, and key terms before attempting a code-along exercise. Usage: /study <exercise-number>
allowed-tools: Glob, Read, Write
---

Produce a focused study guide for exercise $ARGUMENTS.

## Step 1 — Find the exercises file

Use Glob to find `*_exercises.md` in the current directory. Read it.

If $ARGUMENTS is empty, ask: "Which exercise number do you want to study? (e.g. `/study 3`)"

Find Exercise $ARGUMENTS in the file. Read its full content, especially:
- The Concepts section
- The Instructions (to understand what knowledge is needed)
- The References already listed
- The tech stack from the header

## Step 2 — Build the study guide

Think carefully about what a learner truly needs to understand *before* they can attempt this exercise successfully. Go deeper than the exercise file itself — fill in gaps, explain context, and surface the prerequisites that aren't obvious.

Produce a study guide with these sections:

---

**Section 1: What you need to know**

For each key concept the exercise requires (3-6 concepts), write a plain-language explanation:

```
**{Concept Name}**

{3-4 sentences explaining:
  - What it is in simple terms (no jargon first)
  - Why it exists / what problem it solves
  - How it's used in THIS specific exercise
  - One concrete analogy if helpful}
```

Do not just list facts — explain the "why" behind each concept. A beginner should be able to read this and understand the purpose, not just the definition.

---

**Section 2: Read these first (required)**

List 3-5 resources the learner MUST read before attempting the exercise. For each:

```
**{Resource title}**
Link: {url}
Focus on: {specific section, chapter, or concept to pay attention to — not just "read it"}
Skip: {parts they can skip for now to save time}
Time: ~{N} minutes
```

Use the References from the exercise as a starting point, but add more as needed based on the concepts. Resources must be real, well-known documentation pages (official docs, MDN, language guides — not random blog posts).

---

**Section 3: Skim these (optional context)**

2-3 resources that give useful background but aren't required. Same format as above but shorter.

---

**Section 4: Key terms glossary**

List 5-8 terms the learner will encounter in the exercise. Format:

```
**{term}** — {one-sentence definition in plain language, not copied from docs}
```

Only include terms that will appear in the exercise code or instructions. Make definitions concrete, not abstract.

---

**Section 5: Warm-up check**

Write 2-3 questions the learner should be able to answer BEFORE starting to code. These verify they've absorbed the study material:

```
1. {Question that requires understanding, not just recall}
   → If you can answer this, you're ready. If not, re-read: {specific resource section}

2. {Question about the relationship between two concepts}
   → If you can answer this, you're ready. If not, re-read: {specific resource section}
```

---

## Step 3 — Save the study guide

Use Write to save as `exercise_{N}_study.md` in the current directory.

Tell the user:
- The filename saved
- How many concepts are covered
- The estimated total reading time (sum of all resource times)
- Next step: "When you feel ready, run `/start-exercise $ARGUMENTS` to get a starter file."
