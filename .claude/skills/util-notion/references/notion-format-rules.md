# Notion Format Rules

Conversion rules for transforming arbitrary text into Notion-compatible Markdown.

## Supported by Notion

Notion uses standard Markdown for page content. The following syntax is supported.

### Headings

| Level | Syntax | Example |
|-------|--------|---------|
| H1 | `# ` | `# Main Title` |
| H2 | `## ` | `## Section` |
| H3 | `### ` | `### Subsection` |
| H4 | `#### ` | `#### Detail` |
| H5 | `##### ` | `##### Minor` |
| H6 | `###### ` | `###### Smallest` |

**Conversion rules:**
- Word/Google Docs "Title" style → `# `
- "Heading 1" / "Heading 2" etc. → `#`, `##`, etc.
- ALL CAPS lines that look like titles → `## ` (or infer level from context)

### Lists

**Unordered (bullets):**
- Use `* ` or `- ` at line start
- Nested: indent with 2 spaces (or tab) before the marker

**Ordered (numbered):**
- Use `1. ` at line start
- Nested: indent with 2 or 4 spaces per level
- Notion handles display style automatically

**Checkboxes:**
- `- [ ]` for unchecked
- `- [x]` for checked

### Inline Formatting

| Effect | Syntax |
|--------|--------|
| Bold | `**text**` |
| Italic | `*text*` |
| Strikethrough | `~~text~~` |
| Code | `` `text` `` |
| Link | `[text](url)` |

### Blockquotes and Callouts

- Blockquotes: `> ` at line start
- Notion callouts: Use `> ` for blockquotes; toggle blocks may need manual mapping when syncing

### Tables

Standard Markdown tables:

```
| Col1 | Col2 |
|------|------|
| A    | B    |
```

### From Other Sources

**From Word/Google Docs:**
- Title style → `# `
- Heading 1/2/3 → `#`, `##`, `###`
- Bullet lists → `* ` or `- `
- Numbered lists → `1. `

**From Atlassian:**
- Atlassian Markdown is largely compatible with Notion
- Numbered list nesting (4-space indent) works in Notion
- Tables use same syntax

### Database Properties

Notion has specific formats for relation, rollup, and formula properties. When syncing document pages (not database rows), standard Markdown applies. Document any database-specific conventions in `System/notion-config.md` if needed.
