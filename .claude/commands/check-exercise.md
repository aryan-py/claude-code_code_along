---
description: Review your implementation of a code-along exercise and get structured feedback — what's done, what's missing, what's wrong. No solutions given. Usage: /check-exercise [exercise-number]
allowed-tools: Glob, Read, Bash
---

Review the learner's implementation for exercise $ARGUMENTS.

## Step 1 — Find the exercise and implementation

Use Glob to find `*_exercises.md` in the current directory. Read it.

Determine which exercise to check:
- If $ARGUMENTS is a number, check that exercise
- If $ARGUMENTS is empty:
  - Run `git diff --name-only HEAD 2>/dev/null || find . -newer *_exercises.md -name "*.py" -o -name "*.ts" -o -name "*.js" -o -name "*.go" 2>/dev/null | head -5` via Bash to find recently modified files
  - Match the most recently modified source file to its exercise by comparing against `file_to_create` fields
  - Tell the user: "Checking exercise N based on the file you're working on (`{filename}`). Use `/check-exercise N` to check a specific one."

Read the exercise:
- Instructions (the expected steps)
- Learning objectives (what they should have achieved)
- Concepts (what understanding to verify)
- `file_to_create` (which file to review)

Read the learner's implementation file. If it doesn't exist yet, say: "The file `{filename}` doesn't exist yet. Run `/start-exercise $ARGUMENTS` to create a starter file."

## Step 2 — Evaluate the implementation

Assess the implementation against the exercise instructions and learning objectives. Be a good mentor — honest but constructive.

Check for:
1. **Completion** — Is each instruction step implemented? (check specifically, not vaguely)
2. **Correctness** — Does each implementation actually work correctly for its purpose?
3. **Understanding** — Does the code show understanding of the concepts, or does it look cargo-culted?
4. **Missing pieces** — Are there empty stubs, TODO comments still present, or unimplemented functions?

## Step 3 — Give structured feedback

Use exactly this format:

```
## Exercise {N} Review

### ✅ Completed correctly
{List what's done well — be specific with function/class names}
- `{function_name}`: {what's correct about it}
...

(If nothing is done yet: "Nothing completed yet — start with TODO 1.")

### ⚠️ Incomplete
{List specific missing items with file:line references where possible}
- `{function_name}` at line {N}: {what's missing — be specific about what needs to be added}
...

(If nothing is missing: "None — all steps are implemented.")

### ❌ Issues found
{List bugs or conceptual misunderstandings — explain WHY it's wrong, not just that it is}
- `{function_name}` at line {N}: {what's wrong and why it matters}
...

(If no issues: "None found.")

### 💡 Your next step
{ONE specific action the learner should take next — a nudge, not the solution.
Example: "Your `validate_age` function exists but doesn't raise an error yet — what should happen when age is invalid?"}

---
{Verdict}
```

**Verdict options:**
- `🎉 Exercise complete! Move on to /study {N+1} when ready.`
- `⏳ Almost there — {N} item(s) left. Fix the issues above and run /check-exercise again.`
- `🔨 Still in progress — focus on TODO {N} first.`

**Critical rule:** Do NOT show the correct implementation. Only diagnose and nudge. If the learner asks "what's the answer?", say: "Try `/hint exercise {N} step {M}` for a progressive nudge — or keep at it, you're close!"
