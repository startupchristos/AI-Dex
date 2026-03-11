---
name: linkedin-post-generator-custom
description: Create LinkedIn posts in Christos's voice — venture portfolio operator, post-investment execution focus. Use when the user wants to create, draft, or write a LinkedIn post. Topic may be provided manually or selected from LinkedIn-Post-Queue.md. Loads strategy and writing rules, generates post (100–250 words), and validates mandatory stop line.
---

# LinkedIn Post Generator

Create short-form, high-impact LinkedIn posts that clarify execution risk and enforce discipline. Every post is anchored in a recent trigger and includes an explicit stop/pause/kill judgment.

## Required Context

**Before generating, load both files:**

1. `05-Areas/PPM-Career/Thought-Leadership/LinkedIn-Strategy.md` — Role, audience, themes by day, 8-week calendar
2. `05-Areas/PPM-Career/Thought-Leadership/LinkedIn-Posts/LinkedIn-Post-Writing.md` — Point of view, tone, structure, mandatory checks, example

## Workflow

### Step 1: Get the Trigger and Angle

**Topic source — either:**

**A) From the queue:** If the user wants to use the post queue, load:
`05-Areas/PPM-Career/Thought-Leadership/LinkedIn-Posts/LinkedIn-Post-Queue.md`

Ask which post to generate (e.g. "Week 3 Monday" or "next one"). Use the Trigger and Angle from that row as the input.

**Hook and Stat rotation:** Scan published rows for Hook (1–9) and Stat values. Prefer the least recently used hook type. When using hooks 4 or 5, prefer the least recently used stat (30+acc, 100+startups, 100+founders, 5VCs). Record the chosen Hook and Stat in the queue when the user marks the post as published.

**B) Manual:** If the user provides the topic themselves, ask: "What recently triggered this? (post-investment review, dashboard, leadership conversation, decision you were asked to approve, pattern that surfaced this week)"

If the user provides a day (e.g. "for Monday"), infer the theme from the calendar. If ambiguous, ask.

### Step 2: Infer Theme

- **Monday** — Value over Hype (activation, retention, niche focus, traction as hypothesis)
- **Wednesday** — Designing Systems That Scale with Leverage (AI-native, organizational architecture, structural amplifier)
- **Friday** — Leadership for Scale (decision authority, discipline, focus, leadership failure modes)

### Step 3: Generate Post

- 100–250 words
- Structure: Hook (bold observation from trigger) → Body (one failure pattern) → Close (decisive judgment, not CTA)
- Must include at least one explicit stop/pause/kill/refusal
- Follow all rules in LinkedIn-Post-Writing.md
- **Hook selection:** If generating from the queue, check recent Hook values in published rows. Choose the least recently used of the 9 hook types. If hooks 4 or 5, also pick the least recently used stat.

### Step 4: Validate

1. **Final check:** "What did I recently see that triggered this judgment — and what would I stop, cut, or refuse?"
2. **Mandatory stop line:** Verify at least one explicit stop/pause/kill is present. If not, rewrite.
3. **Audience filter:** Would this resonate with a GP, operating partner, or post-seed founder? Remove anything that sounds like advice for first-time founders.

### Step 5: Output and Save

Display the post for review. When the user approves, save as a plain text file (.txt) for easy copy/paste into LinkedIn:

- **Folder:** `C:\Users\chris\OneDrive\Documents\PPM Career\Thought Leadership\Linkedin posts`
- **Filename:** `YYYYMMDD Linkedin post - [first 50 characters of post].txt`
- **Format:** Plain text only — no markdown, no headers, no formatting symbols

Use today's date. Wait for user approval before saving.

**After publishing:** When the user marks the post as published in the queue, remind them to record the Hook (1–9) and Stat (if hooks 4 or 5) used. This enables rotation for future posts.

## Notes

- Custom skill, protected from Dex updates
- Edit `05-Areas/PPM-Career/Thought-Leadership/LinkedIn-Strategy.md` or `LinkedIn-Posts/LinkedIn-Post-Writing.md` to change voice or rules
