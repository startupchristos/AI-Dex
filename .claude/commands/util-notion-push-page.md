# Push Local File to Notion Page

Push a Markdown file from the `06-Resources/Notion/` folder back to its Notion page, updating the remote content.

## Input

The user provides one of the following (options may be combined):

1. **A local filename** (e.g., `My-Document.md`). Search `06-Resources/Notion/**/*.md` for a file with that name. The file must contain YAML frontmatter with `notion_page_id`.
2. **A Notion page URL** plus a local filename. The URL overrides any frontmatter page ID.
3. **Just a Notion URL**. Search all `06-Resources/Notion/**/*.md` for a file whose frontmatter `notion_page_id` matches the page ID in the URL.

4. **Optional flags**: `--force` or `-y` — when provided, skip the version conflict confirmation and proceed with overwrite if remote was edited more recently than local.

If neither a frontmatter `notion_page_id` nor a URL argument is available, stop and ask the user to provide one.

## Procedure

### Step 0: Load util-notion (Required)

Load the util-notion skill by reading `.claude/skills/util-notion/SKILL.md`. This skill loads the agent and format rules. **Never call Notion MCP tools without this.** All Notion operations go through util-notion.

### Step 1: Identify the Local File

Locate the target file by searching `06-Resources/Notion/**/*.md` recursively.

- If the user provided a filename, search for `**/<filename>` under `06-Resources/Notion/`.
- If the user provided only a URL, search all `06-Resources/Notion/**/*.md` for a file whose frontmatter `notion_page_id` matches the page ID in the URL. If no match is found, stop and ask the user to specify the filename.

Read the file using the `Read` tool. Record the full path — you will write the updated frontmatter back to this same path after pushing.

### Step 2: Parse Frontmatter and Body

**Frontmatter format**: See `.claude/reference/notion-frontmatter-format.md`. If the file lacks a closing `---` before the body, or has malformed `notion_url` (e.g. markdown link syntax), fix it before parsing.

Split the file content into:

- **YAML frontmatter**: Everything between the opening `---` and closing `---`.
- **Markdown body**: Everything after the closing `---`.

Extract from frontmatter:
- `notion_page_id` (required unless URL provided)
- `notion_url`
- `title`
- `last_edited_time` (used for conflict detection)

### Step 3: Resolve the Target Page ID

Determine the Notion page ID to update:

1. If the user provided a URL argument, extract the page ID from the URL. This takes priority.
2. Otherwise, use `notion_page_id` from the frontmatter.
3. If neither is available, stop and ask the user.

### Step 4: Version Conflict Check

Fetch the current state of the Notion page using the Notion MCP retrieve tool.

Compare the **remote `last_edited_time`** against the **local frontmatter `last_edited_time`** (or `checked_out_at`).

- **If remote equals local or local is newer**: No conflict. Proceed to Step 5.
- **If remote is newer than local**: Someone else has edited the page since checkout.
  - **If user provided `--force` or `-y`**: Proceed with overwrite without prompting.
  - **Otherwise**: Warn the user (show local vs remote timestamps), ask whether to overwrite or abort. If they choose to abort, stop without pushing.
- **If the remote page is not found**: Stop and report the error (page may have been deleted or permissions changed).

### Step 5: Push Content to Notion

Call the Notion MCP update tool (e.g. `update-a-page`) with:
- `page_id`: the resolved page ID
- `body` or `content`: the Markdown body (everything after the frontmatter, with leading/trailing whitespace trimmed)
- `title`: the `title` from frontmatter (or the current remote title if not in frontmatter)

Check the MCP tool descriptors for the exact parameter names.

### Step 6: Update Local Frontmatter

After a successful push, the update response may include the new `last_edited_time`. Use that to update the local file's YAML frontmatter:
- `last_edited_time`: set to the new value from the response (ISO 8601)
- `checked_out_at`: set to the same timestamp (or now)

Write the updated file back to the same path where it was found using the `Write` tool. Keep the Markdown body unchanged.

### Step 7: Confirm

Report to the user:
- Page title
- Notion page URL
- Local file path (confirm frontmatter updated)
- Timestamp

## Error Handling

- If the local file cannot be found, list available `.md` files in `06-Resources/Notion/` and ask the user to specify which one.
- If the frontmatter is missing or malformed, report what is missing and ask the user to provide the Notion URL manually.
- If the Notion API returns an error (permissions, page not found), report the error clearly and do not modify the local file.
- If the push fails, do NOT update local frontmatter — the local file should remain unchanged on failure.
