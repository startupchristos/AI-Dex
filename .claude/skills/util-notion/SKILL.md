---
name: util-notion
description: Notion integration for document pages via MCP. Format conversion for Notion Markdown. Use for ALL tasks involving Notion pages, search, content creation/updates, or formatting content for Notion.
---

# Notion Integration Skill

## When to Use

Invoke this skill for ANY task involving:
- Notion pages: create, read, update, search
- Notion databases/data sources: query, retrieve
- Any reference to Notion page IDs or URLs
- **Format-only**: User pastes content and wants it formatted for Notion; user says "format this for Notion"; user provides a local `.md` file and wants it cleaned for Notion

## Prerequisite: Never Call Notion MCP Directly

**All Notion access must go through this skill.** Commands and skills that touch Notion must explicitly load util-notion first. Never call Notion MCP tools without having loaded this skill and the agent.

## Agent Instructions

Load and follow the full agent protocol defined in:
`.claude/agents/notion-agent.md`

Read that file before executing any Notion operation. It contains:
- Search strategy (natural language vs query-data-source)
- Content format handling (Notion Markdown rules)
- Tool usage priority
- Response patterns and output format

**When drafting content** for Notion pages, apply format rules from `.claude/skills/util-notion/references/notion-format-rules.md` so output uses Notion-compatible Markdown (headings `#`–`######`, lists `*`/`1.`, tables, inline formatting).

## Format-Only Workflow

When the user wants to format content **without** pushing to Notion (e.g., paste from Word, "format this for Notion", or "clean this markdown file"):

1. Accept input from pasted content, a file path, or conversation
2. If input is a file path: read the file first
3. For Pandoc/dirty markdown cleanup: invoke `util-clean-markdown` in **programmatic mode**. Load the command, pass the content (from file or paste), apply the cleanup rules, and use the returned cleaned text. Then apply Notion-specific output conventions from `.claude/skills/util-notion/references/notion-format-rules.md` and output for copy-paste.
4. Output formatted text in a code block for copy-paste
5. If input was a file: optionally offer to overwrite the file with cleaned content
6. Optionally offer to push to Notion (then follow MCP flow)

No MCP calls needed for format-only requests.

## Workspace Context

Notion workspace configuration (page IDs, sync folder, hierarchy) is documented in:
`System/notion-config.md`

Read this file when you need page IDs, default sync folder, or document organization details.

## Quick Reference

### Always do first
1. Load util-notion (this skill) — required before any Notion MCP call
2. Read `.claude/agents/notion-agent.md` for operational rules
3. Read `System/notion-config.md` if you need page IDs or sync folder

### Format rules (apply when writing for Notion)
| Element | Notion Markdown |
|---------|-----------------|
| H1 | `# Title` |
| Bullet list | `* item` or `- item` |
| Numbered list | `1. item` (nest with 2–4 space indent) |
| Bold | `**text**` |
| Code | `` `text` `` |
| Table | `\| Col1 \| Col2 \|` + `\|---\|---\|` |

### MCP Tools Available
Notion MCP tools (v2.x): search, retrieve-a-page, create-a-page, update-a-page, query-data-source, retrieve-a-data-source, move-page, comments, etc.
