---
description: "Analyze the current project and generate a code-along exercises file that teaches someone to rebuild it from scratch. Usage: /generate-exercises [focus-area]"
allowed-tools: "Glob, Read, Write, Bash"
---

Analyze this project and produce a complete code-along exercises file.

Focus area (if specified): $ARGUMENTS

## Step 1 — Understand the project

Run `git remote get-url origin 2>/dev/null || basename "$(pwd)"` via Bash to get the project name.

Use Glob to map the project structure:
- Find all source files: `**/*.{py,ts,js,go,rs,java,rb,cs,cpp,swift,kt}`
- Find config/setup files: `pyproject.toml`, `package.json`, `go.mod`, `Cargo.toml`, `*.yaml`, `*.yml`
- Find documentation: `README*`, `docs/**`

Read these files (use judgment — read the most important ones, not everything):
- The README or main documentation file
- The primary entry point (main.py, index.ts, main.go, etc.)
- All model/schema/type definition files
- All route/handler/controller files
- Configuration files (pyproject.toml, package.json, etc.)
- Up to 8-12 files total — prioritize files a learner MUST create

## Step 2 — Plan the curriculum

Based on what you've read, determine:
1. **Tech stack**: languages, frameworks, libraries
2. **Key files**: the files a learner must create to rebuild this project, in logical build order
3. **Build order**: data models/types → utilities → core logic → API/routes → config → tests
4. **Complexity**: beginner / intermediate / advanced

Create a numbered curriculum outline — one exercise per key file or logical feature. Evaluate it:
- Does it cover all the important files?
- Is it ordered from simple to complex?
- Can a developer follow this sequence to rebuild the full project?

If not, revise before continuing.

## Step 3 — Write the exercises

For EACH item in the curriculum outline, write one full exercise using this exact structure:

```
## Exercise N: {title}

**Difficulty:** {level} &nbsp;|&nbsp; **File to create:** `{filename}`
**Prerequisites:** Exercise {list} &nbsp;|&nbsp; **Estimated time:** {N} min

{one paragraph description}

### Concepts

Before coding this exercise, understand these concepts:

**{Concept Name}**
{2-4 sentence plain-language explanation of what it is and why it matters for THIS exercise specifically. Not just a definition — explain why it's relevant here.}

**{Concept Name}**
{explanation}

(2-4 concepts per exercise)

### Instructions

1. {Concrete step — name specific functions, classes, or patterns to implement} — *Why: {one sentence on why this step exists}*
2. {Step} — *Why: {reason}*
...
(5-10 steps per exercise)

### Hints

- {Nudge toward the right direction — NOT the solution. Hints should make the learner think, not copy.}
- {Another nudge}

### Self-check

After completing this exercise, you should be able to answer:
1. {Question testing understanding of the core concept, not just code recall}
2. {Question about a design decision: "Why did we do X instead of Y?"}
3. {Question about consequences: "What would break if you changed X?"}

### Extension challenges

- **Easy:** {small feature addition to the existing file}
- **Medium:** {meaningful change that requires understanding the concepts deeper}
- **Hard:** {architectural change, optimization, or integration with another part of the project}

### References

- [{title}]({real-url}) — {what specifically to focus on in this resource}
- [{title}]({real-url}) — {focus}
```

Generate as many exercises as the project needs — one per key file. Do not cap.

## Step 4 — Save the file

Use Write to save as `{project_name}_exercises.md` in the current directory with this header:

```
# Code-Along: {project_name}

> {one-line description of the project}
>
> **Tech stack:** {comma-separated list}
> **Complexity:** {beginner|intermediate|advanced}
> **Total exercises:** {N}
>
> **How to use this guide:**
> 1. `/study N` — read the study guide before each exercise
> 2. `/start-exercise N` — get a starter file with TODOs
> 3. `/hint` — get a progressive nudge if stuck
> 4. `/check-exercise N` — verify your work when done

---

## Table of Contents

1. [Exercise title](#exercise-1) _beginner_ — `filename`
2. [Exercise title](#exercise-2) _intermediate_ — `filename`
...

---
```

After saving, tell the user:
- Filename saved
- Number of exercises generated
- The first 3 exercise titles as a preview
- Reminder: "Run `/study 1` before starting exercise 1."
