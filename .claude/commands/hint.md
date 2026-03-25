---
description: "Get a progressive hint for a specific exercise step — each call reveals a little more without giving the answer. Usage: /hint [exercise N step M] [level 1|2|3]"
allowed-tools: "Glob, Read"
---

Give a progressive hint for: $ARGUMENTS

## Step 1 — Parse the request

Parse $ARGUMENTS to extract:
- Exercise number (e.g., "exercise 3" or just "3")
- Step number (e.g., "step 2" or just "2")
- Hint level: 1, 2, or 3 (if not specified, ask: "Is this your first hint for this step, second, or third?")

If $ARGUMENTS is empty or unclear, ask:
"Which exercise and step are you stuck on? (e.g., `/hint exercise 2 step 4` or `/hint 2 4`)"

## Step 2 — Find the context

Use Glob to find `*_exercises.md` in the current directory. Read it.

Find the exercise and the specific instruction step they're stuck on.

Also read the learner's current implementation file if it exists (from `file_to_create`) — this helps give a hint that's specific to what they've already written.

## Step 3 — Give the hint at the right level

**Level 1 (first hint) — Conceptual nudge:**
Explain the concept or principle behind this step WITHOUT showing any code or giving the structure. Help them understand *what* they need to think about, not *how* to do it.

Example format:
```
💭 Hint (Level 1 of 3)

This step is about {concept}.

{2-3 sentences explaining the concept in plain language and why it applies here.}

Think about: {a guiding question that points them in the right direction without revealing the answer}
```

**Level 2 (second hint) — Structural hint:**
Describe the shape of the solution — the inputs, outputs, and pattern — without writing the implementation. You can describe what the code should look like in English.

Example format:
```
🔍 Hint (Level 2 of 3)

You need a {function/class/block} that:
- Takes: {input description}
- Does: {action in plain English}
- Returns/produces: {output description}

The pattern looks like: {describe the structure in words, e.g., "a for loop that iterates over each item and checks a condition"}

Look at how {similar thing in the codebase} handles a similar pattern.
```

**Level 3 (third hint) — Near-solution:**
Show a parallel example — either from a DIFFERENT part of the codebase that uses the same pattern, or a simplified version of the concept applied to a different problem. Do NOT show the solution to this specific step.

Example format:
```
🎯 Hint (Level 3 of 3)

Here's the same pattern applied to a different problem:

{code example that uses the identical pattern but for a different purpose — not copied from the exercise}

Apply this pattern to your situation: {one sentence on how to adapt it}

If you're still stuck after this, try running /check-exercise to see specifically what's missing.
```

## Step 4 — Close the hint

Always end with:
```
---
💪 Give it a try now. Run `/check-exercise {N}` when you think you have it.

Need the next level? Run `/hint exercise {N} step {M} level {current+1}` (if current < 3).
```

**Critical rule:** Never give the direct solution. If the learner explicitly asks for the answer, say: "I won't give you the direct solution — that would rob you of the learning! But you're {assessment of how close they are}. Try the hint above and run `/check-exercise` to see how it went."
