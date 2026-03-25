---
description: "Generate a starter file for a code-along exercise with imports, empty stubs, and TODO comments — one per instruction step. Usage: /start-exercise <exercise-number>"
allowed-tools: "Glob, Read, Write"
---

Create a starter file for exercise $ARGUMENTS.

## Step 1 — Find the exercise

Use Glob to find `*_exercises.md` in the current directory. Read it.

Find Exercise $ARGUMENTS. Extract:
- `file_to_create` — the exact path/filename to generate
- `instructions` — the numbered steps (each becomes a TODO)
- `concepts` — the key concepts (go into docstrings)
- The tech stack / language from the file header

## Step 2 — Check prerequisites

Read the Prerequisites line from the exercise. If the prerequisite files don't exist yet, warn the user:
"⚠️  Exercise {N} requires Exercise {M} to be complete first. The file `{prereq_file}` doesn't exist yet. Consider doing that exercise first, or continue anyway if you want to jump ahead."

Do NOT stop — let them proceed regardless.

## Step 3 — Generate the starter file

Create a starter file at the `file_to_create` path. Follow these rules:

**DO include:**
- All necessary imports for the exercise (figure these out from the instructions and tech stack — don't make the learner hunt for import names)
- A module-level docstring explaining what this file does and which exercise it belongs to
- Every class, function, or component signature from the instructions — with correct types/signatures
- A docstring on each function/class explaining what it should do when complete
- One `# TODO N:` comment per instruction step, written as a specific directive:
  - BAD:  `# TODO 3: implement the validation logic`
  - GOOD: `# TODO 3: Add a validator that checks age > 0 and age < 120, raise ValueError with message "Age must be between 0 and 120" if invalid`
- If the exercise has several similar items (multiple route handlers, multiple model fields, etc.):
  - Implement the FIRST one completely as a worked example with a comment: `# EXAMPLE — study this pattern, then apply it to the TODOs below`
  - Stub out the remaining ones with TODOs

**DO NOT include:**
- Any implemented logic (except the one worked example)
- Answers to the exercise
- Anything that gives away the solution

## Step 4 — Save and report

Use Write to save the starter file at the exact path from `file_to_create`.

Tell the user:
- What file was created and where
- How many TODOs they need to fill in (list them with their numbers)
- Which TODO to start with and why (usually TODO 1, unless there's a logical dependency)
- "Run `/hint exercise $ARGUMENTS step 1` if you get stuck on the first TODO."
- "Run `/check-exercise $ARGUMENTS` when you think you've finished."
