# Skill Design Principles

Core principles for building high-quality, context-efficient skills. Apply these before writing any SKILL.md.

---

## Concise is Key

The context window is a public good. Skills share it with everything else Claude needs: system prompt, conversation history, other skills' metadata, and the actual user request.

**Default assumption: Claude is already very smart.** Only add context Claude doesn't already have. Challenge each piece: "Does Claude really need this explanation?" and "Does this paragraph justify its token cost?"

Prefer concise examples over verbose explanations.

---

## Set Appropriate Degrees of Freedom

Match the level of specificity to the task's fragility and variability:

**High freedom (text-based instructions):** Use when multiple approaches are valid, decisions depend on context, or heuristics guide the approach.

**Medium freedom (pseudocode or scripts with parameters):** Use when a preferred pattern exists, some variation is acceptable, or configuration affects behavior.

**Low freedom (specific scripts, few parameters):** Use when operations are fragile and error-prone, consistency is critical, or a specific sequence must be followed.

Think of Claude as exploring a path: a narrow bridge with cliffs needs specific guardrails (low freedom), while an open field allows many routes (high freedom).

---

## Anatomy of a Skill

Every skill consists of a required SKILL.md and optional bundled resources:

```
skill-name/
├── SKILL.md (required)
│   ├── YAML frontmatter (required)
│   │   ├── name: (required)
│   │   ├── description: (required)
│   │   └── compatibility: (optional, rarely needed)
│   └── Markdown instructions (required)
└── Bundled Resources (optional)
    ├── scripts/       - Executable code (Python/Bash/etc.)
    ├── references/    - Documentation loaded into context as needed
    └── assets/        - Files used in output (templates, icons, fonts, etc.)
```

### Frontmatter

- `name`: The skill name (kebab-case, max 64 characters)
- `description`: **Primary triggering mechanism.** Include what the skill does AND specific scenarios when it should trigger. "When to use" belongs here, not in the body — the body is only loaded after triggering.
  - Example: `"Comprehensive document creation, editing, and analysis with support for tracked changes, comments, formatting preservation, and text extraction. Use when Claude needs to work with professional documents (.docx files) for: (1) Creating new documents, (2) Modifying or editing content, (3) Working with tracked changes, (4) Adding comments, or any other document tasks"`

Do not include any fields other than `name`, `description`, `license`, `metadata`, `compatibility`, and `allowed-tools`.

### Body

Write instructions for using the skill. Keep under 500 lines — split out detailed content into `references/` files.

---

## Bundled Resources

### scripts/

Executable code (Python/Bash/etc.) for tasks that require deterministic reliability or are repeatedly rewritten.

- **When to include:** When the same code is rewritten repeatedly or deterministic reliability is needed
- **Benefits:** Token efficient, deterministic, can be executed without loading into context
- **Note:** Scripts may still need to be read by Claude for patching or environment-specific adjustments

### references/

Documentation intended to be loaded into context as needed to inform Claude's process and thinking.

- **When to include:** For documentation Claude should reference while working
- **Examples:** Database schemas, API documentation, domain knowledge, company policies, detailed workflow guides
- **Best practice:** If files are large (>10k words), include grep search patterns in SKILL.md
- **Avoid duplication:** Information should live in either SKILL.md or a references file, not both

### assets/

Files not intended to be loaded into context, but used within the output Claude produces.

- **When to include:** When the skill needs files that will be used in the final output
- **Examples:** PowerPoint templates, HTML/React boilerplate, fonts, logo files, sample documents

---

## What NOT to Include in a Skill

A skill should only contain files that directly support its functionality. Do NOT create:

- README.md
- INSTALLATION_GUIDE.md
- QUICK_REFERENCE.md
- CHANGELOG.md
- Any other auxiliary documentation

The skill should not contain context about the process that went into creating it, setup instructions, or user-facing documentation. Adding these files creates clutter and confusion.

---

## Progressive Disclosure Design Principle

Skills use a three-level loading system to manage context efficiently:

1. **Metadata (name + description)** — Always in context (~100 words)
2. **SKILL.md body** — When skill triggers (<5k words, target <500 lines)
3. **Bundled resources** — As needed by Claude (unlimited, scripts can run without loading)

### Key Principle

Keep SKILL.md to the essentials. Split content into separate files when approaching 500 lines. When splitting, reference the files clearly from SKILL.md and describe when to read them.

When a skill supports multiple variations or options, keep only the core workflow and selection guidance in SKILL.md. Move variant-specific details into reference files.

### Disclosure Patterns

**Pattern 1: High-level guide with references**

```markdown
## Advanced features

- **Form filling**: See [FORMS.md](FORMS.md) for complete guide
- **API reference**: See [REFERENCE.md](REFERENCE.md) for all methods
```

Claude loads FORMS.md or REFERENCE.md only when needed.

**Pattern 2: Domain-specific organization**

For skills with multiple domains, organize by domain to avoid loading irrelevant context:

```
bigquery-skill/
├── SKILL.md (overview and navigation)
└── references/
    ├── finance.md
    ├── sales.md
    └── product.md
```

When a user asks about sales metrics, Claude only reads `sales.md`.

**Pattern 3: Conditional details**

```markdown
## Editing documents

For simple edits, modify the XML directly.

**For tracked changes**: See [REDLINING.md](REDLINING.md)
**For OOXML details**: See [OOXML.md](OOXML.md)
```

---

## Iteration

After using the skill on real tasks:

1. Notice struggles or inefficiencies
2. Identify how SKILL.md or bundled resources should be updated
3. Implement changes and test again

The best skills evolve from real usage, not upfront design alone.

---

## Structure Types

Choose the structure that best fits the skill's purpose:

| Type | Best for | Example pattern |
|---|---|---|
| **Workflow-based** | Sequential processes | Overview → Decision tree → Step 1 → Step 2 |
| **Task-based** | Tool collections / multiple operations | Overview → Quick Start → Task 1 → Task 2 |
| **Reference/guidelines** | Standards, specs, brand | Guidelines → Colors → Typography → Usage |
| **Capabilities-based** | Integrated systems with interrelated features | Core Capabilities → Feature 1 → Feature 2 |

Patterns can be mixed. Most skills combine two.
