# Checkout Notion Page to Local File

Check out a Notion page into the `06-Resources/Notion/` folder as a Markdown file with metadata.

## Input

The user will provide:

1. **Notion page URL or page ID**. Example formats:
   - `https://www.notion.so/<workspace>/<page-id>`
   - `https://www.notion.so/<page-title>-<page-id>`
   - Raw page ID (UUID format)

2. **Optional folder** (default: `06-Resources/Notion/`). If the user wants a subfolder, use it (e.g. `06-Resources/Notion/Reference/`).

## Procedure

### Step 0: Load util-notion (Required)

Load the util-notion skill by reading `.claude/skills/util-notion/SKILL.md`. This skill loads the agent and format rules. **Never call Notion MCP tools without this.** All Notion operations go through util-notion.

### Step 1: Resolve Output Folder

Use `06-Resources/Notion/` as the default. If the user specified a subfolder, use that. Create the folder if it does not exist.

### Step 2: Parse the Page ID

If the user provided a URL, extract the page ID (UUID format, 32 hex chars with optional hyphens). Notion URLs typically contain the page ID as the last segment.

If the user provided only a page ID, use it directly.

If the URL or ID cannot be parsed, use the Notion MCP search tool to find the page by title, then use the returned page ID.

### Step 3: Fetch the Notion Page

Call the Notion MCP tool to retrieve the page content. Use the tool that returns Markdown format (e.g. `retrieve-a-page` or equivalent). Check the MCP tool descriptors for the exact tool name and parameters.

### Step 4: Compose Local File

**Filename**: Use the page title returned by the API. Sanitize it for filesystem safety (remove characters like `\ / : * ? " < > |`). The file is named `<Sanitized Page Title>.md`.

**File path**: `06-Resources/Notion/<Sanitized Page Title>.md` (or user-specified subfolder).

**File contents**: Compose the file with YAML frontmatter followed by the page body in Markdown. See `.claude/reference/notion-frontmatter-format.md` for the required structure:

```
---
notion_page_id: "<pageId>"
notion_url: "<plain URL, no markdown link syntax>"
title: "<page title>"
last_edited_time: "<ISO 8601 if available>"
checked_out_at: "<ISO 8601 timestamp of now>"
---

<page body in Markdown>
```

### Step 5: Check for Existing File

Before writing, check if the target file already exists in the output folder.

- **If the file does NOT exist**: Create it and proceed.
- **If the file DOES exist**: Ask the user whether to overwrite the existing file. If they decline, stop without writing.

### Step 6: Write the File

Write the composed content to the target path using the `Write` tool.

### Step 7: Confirm

Report to the user:
- Page title
- Local file path
- Timestamp

## Error Handling

- If the URL cannot be parsed, use the Notion MCP search tool to find the page by title.
- If the Notion API returns an error (page not found, permissions), report the error clearly. Remind the user to share the page with their Notion integration.
- If the output folder does not exist, create it before writing.
