---
name: create-skill-custom
description: Create a new custom skill for AI-Dex, protected from Dex updates. Use when you want to build a new skill, command, or workflow extension. Skills get a -custom suffix automatically so Dex updates never overwrite them.
---

# Create Custom Skill

Creates a new skill in `.claude/skills/{name}-custom/` — protected from Dex updates.

**Before writing anything**, read [`references/design-principles.md`](references/design-principles.md) to apply Anthropic's skill design standards. This step is not optional — it determines the quality of what gets created.

---

## Process

### Step 1: Understand the Skill

Ask the user:

```
What should this skill do?

Give me:
1. A short name (e.g., "meeting-notes", "weekly-report")
2. What it should help with (1-2 sentences)
3. Any examples of how you'd invoke it or what inputs it takes
```

Clarify until you have a clear picture of:
- The primary use case and what triggers it
- Whether it needs scripts, references, or assets (or none — most simple skills don't)
- The right structure type: workflow-based, task-based, reference/guidelines, or capabilities-based

See `references/design-principles.md` → "Anatomy of a Skill" for structure guidance.

---

### Step 2: Plan Reusable Resources

Before creating any files, identify what bundled resources (if any) the skill needs:

| Type | Folder | Use when |
|---|---|---|
| Executable code | `scripts/` | Same code would be rewritten repeatedly, or needs deterministic output |
| Domain knowledge | `references/` | Detailed docs, schemas, guides too long for SKILL.md |
| Output templates | `assets/` | Templates, images, boilerplate to be copied into final output |

If none are needed, the skill is just a `SKILL.md`. Most simple skills are.

---

### Step 3: Create the Skill

**Skill folder:** `.claude/skills/{name}-custom/`

The `-custom` suffix is automatic — don't let the user add it themselves.

**Option A — Scaffold with the init script (recommended for complex skills):**

```bash
python ".claude/skills/create-skill-custom/scripts/init_skill.py" {name}-custom --path "C:\Users\chris\OneDrive\AI-Dex\.claude\skills"
```

Then edit the generated template.

**Option B — Create SKILL.md directly (fine for simple skills):**

Use this template:

```markdown
---
name: {name}-custom
description: {Comprehensive description. Include WHEN to trigger — specific scenarios, tasks, or file types that should invoke this skill. Not just what it does.}
---

# {Title Case Name}

{1-2 sentence intro}

## Process

### Step 1: [First Step]

[Instructions]

### Step 2: [Second Step]

[Instructions]

## Notes

- This is a custom skill, protected from Dex updates
- Edit `.claude/skills/{name}-custom/SKILL.md` to modify
```

**Quality rules before saving (from `references/design-principles.md`):**
- `description` is the trigger mechanism — must include "when to use" scenarios, not just a summary of what it does
- Keep SKILL.md under 500 lines; move detailed content to `references/`
- No README.md, CHANGELOG.md, or other auxiliary files in the skill folder
- Every line must justify its token cost — context window is shared

---

### Step 4: Validate (Optional but Recommended)

Run the validator to catch structural issues before use:

```bash
python ".claude/skills/create-skill-custom/scripts/quick_validate.py" ".claude/skills/{name}-custom"
```

---

### Step 5: Confirm

```
✅ Created skill: /{name}-custom

Your skill is ready. Run /{name}-custom to try it.

Protected from updates: The -custom suffix means Dex updates will
never overwrite this skill. It's yours to customize.

To edit: Modify .claude/skills/{name}-custom/SKILL.md
```

---

## Reference Files

Load these when needed — don't preload all of them:

- [`references/design-principles.md`](references/design-principles.md) — Core design philosophy: conciseness, degrees of freedom, progressive disclosure, anatomy of a skill, what not to include. **Read before writing any SKILL.md.**
- [`references/output-patterns.md`](references/output-patterns.md) — Template and examples patterns for consistent output quality
- [`references/workflows.md`](references/workflows.md) — Sequential and conditional workflow patterns for multi-step skills

## Scripts

- `scripts/init_skill.py` — Scaffold a new skill directory with template files and resource folders
- `scripts/quick_validate.py` — Validate a skill's frontmatter and structure
- `scripts/package_skill.py` — Package a skill into a distributable `.skill` file (requires `quick_validate.py` in the same directory)

---

## Examples

**User:** "I want a skill for preparing board updates"

**Result:**
- Folder: `.claude/skills/board-update-custom/`
- Invoke with: `/board-update-custom`
- Protected from all Dex updates

**User:** "Create a skill called weekly-standup-custom"

**Response:** "I'll create that as `weekly-standup-custom` — you don't need to add `-custom` yourself, I do that automatically. Want me to proceed with just `weekly-standup`?"

---

## Track Usage (Silent)

Update `System/usage_log.md` to mark custom skill creation as used.

**Analytics (Silent):**

Call `track_event` with event_name `custom_skill_created` and properties:
- (no properties — do NOT include skill names)

This only fires if the user has opted into analytics. No action needed if it returns "analytics_disabled".
