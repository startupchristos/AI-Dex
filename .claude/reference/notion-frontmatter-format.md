# Notion Project File Frontmatter Format

Project Markdown files that sync with Notion **must** use valid YAML frontmatter with a proper closing delimiter.

## Required Structure

```
---
notion_page_id: "<pageId>"
notion_url: "<plain URL, no markdown link syntax>"
title: "<page title>"
last_edited_time: "<ISO 8601 timestamp from Notion>"
checked_out_at: "<ISO 8601 timestamp of checkout>"
---

<Markdown body starts here>
```

## Rules

- **Opening and closing `---`**: Both are required. The closing `---` must be on its own line, immediately after the last frontmatter key.
- **notion_url**: Use the plain URL only (e.g. `https://www.notion.so/Page-Title-abc123def456`). Do NOT use markdown link syntax like `[url](url)`.
- **No blank line** between the closing `---` and the body's first heading.

## If a File Lacks Proper Frontmatter

Before parsing or pushing:
1. Add the closing `---` between the last frontmatter key and the body.
2. Fix `notion_url` if it uses markdown link syntax.
3. Write the corrected file before proceeding.
