# cc-code-along

Claude Code commands that turn any project into a structured coding course — no API keys, no setup, just Claude Code.

## Install

```bash
git clone https://github.com/your-username/cc-code-along
cd cc-code-along
bash install.sh
```

## Commands

| Command | When to use | What it does |
|---|---|---|
| `/generate-exercises` | Once per project | Analyzes the codebase and writes a complete exercise guide |
| `/study <N>` | Before each exercise | Study guide: concepts explained, curated reading list, key terms, warm-up questions |
| `/start-exercise <N>` | When ready to code | Creates a starter file with imports, stubs, and one `TODO` per step |
| `/hint [exercise N step M]` | When stuck | Progressive 3-level hints — concept → structure → example (never the answer) |
| `/check-exercise [N]` | After coding | Structured feedback: ✅ done / ⚠️ missing / ❌ wrong — one nudge, no solutions |

## Suggested workflow

```
/generate-exercises          ← generate the full exercise guide
/study 1                     ← understand what you need to know first
/start-exercise 1            ← get a starter file with TODOs to fill in
   ... write your code ...
/hint exercise 1 step 3      ← if stuck, get a progressive nudge
/check-exercise 1            ← review: what's done, what's missing, what's wrong
   ... fix issues ...
/check-exercise 1            ← "Exercise complete!" → move to exercise 2
/study 2                     ← study for exercise 2 ...
```

## Without installing globally

Drop the command files into your project's `.claude/commands/` folder:

```bash
mkdir -p your-project/.claude/commands
cp .claude/commands/*.md your-project/.claude/commands/
```

All commands become available whenever that project is open in Claude Code.

## What each exercise includes

- **Concepts** — plain-language explanations before you code
- **Instructions** — concrete steps with a *Why* note on each
- **Hints** — nudges, not answers
- **Self-check** — questions to verify you actually understood
- **Extension challenges** — easy / medium / hard variations to go deeper
- **References** — real documentation links with focus notes
