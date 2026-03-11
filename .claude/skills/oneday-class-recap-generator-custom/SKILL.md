---
name: oneday-class-recap-generator-custom
description: Generate Oneday class recap emails for founders from a transcript URL. Use when the user has taught an Oneday class and wants to send a post-session recap summarizing educational content (feedback, upskilling, general startup advice) to participants. Requires transcript URL and recording URL. Skips proprietary founder-specific progress.
---

# Oneday Class Recap Generator

Generate post-class recap emails for Oneday participants. The recap summarizes **educational** content discussed during the session: upskilling, general startup advice, and informative feedback. It excludes proprietary details about specific founders or companies.

## Inputs

**Required:**
1. **Transcript URL** — Link to the class transcript (Google Docs export, Otter, or other text-based source). If the URL cannot be fetched (auth required, etc.), the user can paste the transcript instead.
2. **Recording URL** — Link to the session recording (e.g. Google Drive).
3. **Cohort** — Sparks or Pathfinders. Usually provided when invoking (e.g. "8pm Sparks Notes" → cohort is Sparks). If not clear, ask the user.

**Optional:**
- **Class** — Class cohort folder (default: `Class-7-Digital`). Override if teaching a different class.

## Process

### Step 1: Obtain Inputs

- Ask the user for the transcript URL, recording URL, and cohort (Sparks or Pathfinders) if not provided. Infer cohort from labels when possible (e.g. "8pm Sparks Notes" → Sparks).
- Attempt to fetch the transcript using `mcp_web_fetch` with the given URL.
- If fetch fails (403, auth required, unsupported format), ask the user to paste the transcript text directly.
- Load [references/recap-template.txt](references/recap-template.txt) for the plain-text output format.

### Step 2: Extract Educational Content

Review the transcript and identify content to include:

**Include:**
- General startup advice and frameworks (MVP, validation, monetization, positioning)
- Upskilling content (concepts, tools, methods)
- Informative feedback that applies broadly (e.g. "demand validation comes before supply")
- Teachable moments and principles discussed
- Recurring themes that emerged across multiple founders

**Exclude:**
- Founder names, company names, or specific product details
- Proprietary metrics, traction numbers, or confidential progress
- One-off suggestions tied to a single founder's unique situation
- Personal or relationship-specific context

Group the educational content into coherent topics with clear titles. Each topic = one underlined heading + a short paragraph (~200 characters max) summarizing the teaching point.

### Step 3: Generate Recap

Produce the email following the structure in [references/recap-template.txt](references/recap-template.txt):

- **Opening:** Two lines. (1) Simple, casual thank-you — vary the wording each time (e.g. "Thank you for attending and participating in this week's squad meeting"). (2) One sentence describing what the class was about, with 2–4 concrete examples (e.g. "We spoke about backend, which can include spreadsheets, databases, media libraries, automations, and general logic").
- **What We Covered:** Plain text heading (no bold), then topic blocks.
- **Topic blocks:** Blank line before each topic. Plain topic title (no underline), blank line, then 1–3 sentence description (~200 characters max per topic).
- **Recording:** Plain "Recording" plus the plain URL.
- **Closing:** One short "central reminder" paragraph synthesizing the main takeaway.
- **Sign-off:** Cheers, Christos, LinkedIn URL.

### Step 4: Output Plain Text First

- Display the full recap in **plain .txt format** exactly as in [references/recap-template.txt](references/recap-template.txt): no markdown, no bold, no underline, no HTML. Plain text only.
- **Wrap the output in a code block** (triple backticks with `txt` or no language tag) so blank lines and line breaks are preserved in the chat. Without a code block, markdown rendering collapses newlines.
- Do **not** output HTML or offer HTML at this step.
- Ask the user to review. Iterate on edits until they approve the text.
- When finalized, offer to save to `C:\Users\chris\OneDrive\Documents\PPM Career\Programs & Collaborations\Oneday\classes\Class-7-Digital\` as `YYYYMMDD - [Cohort]-Class-Recap.txt` (e.g. `20260303 - Sparks-Class-Recap.txt`).

### Step 5: Generate HTML After Text is Finalized

- Only when the user says to generate HTML (e.g. "generate HTML", "HTML for copy/paste") after the .txt has been iterated and approved, produce the HTML format from [references/recap-template.md](references/recap-template.md) Gmail section.
- Apply 11pt Trebuchet MS on each `<p>` tag (Gmail does not cascade wrapper div styles when pasting): `style="font-family: 'Trebuchet MS', sans-serif; font-size: 11pt;"`.
- Offer to save the HTML file as `YYYYMMDD - [Cohort]-Class-Recap.html` in the same folder.

## Notes

- Custom skill, protected from Dex updates
- Plain-text format: `references/recap-template.txt`. HTML format: `references/recap-template.md` (Gmail section).
- Save path: `C:\Users\chris\OneDrive\Documents\PPM Career\Programs & Collaborations\Oneday\classes\Class-7-Digital\`. Filename: `YYYYMMDD - [Cohort]-Class-Recap.txt` (e.g. `20260303 - Sparks-Class-Recap.txt`).
- Edit `.claude/skills/oneday-class-recap-generator-custom/SKILL.md` to modify
