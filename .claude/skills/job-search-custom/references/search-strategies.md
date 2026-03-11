# Search Strategies

Default query patterns per job board. Use when Job-Search-Resources.md is sparse or user asks for advanced search behavior.

---

## Query Construction

**Base format:** `[role] [keywords] [location]`

**Role variants:** Use 2–3 phrasings to maximize coverage:
- "VP Product" OR "Head of Product" OR "Chief Product Officer"
- "Fractional CPO" OR "Fractional Head of Product"
- "Operating Partner" OR "Product Operating Partner"

**Keyword injection:** Add 1–2 include keywords that differentiate (e.g., "portfolio", "post-investment") — avoid keyword stuffing.

---

## Per-Source Strategies

| Source | Strategy | Example |
|--------|----------|---------|
| LinkedIn Jobs | `site:linkedin.com/jobs [query]` | `site:linkedin.com/jobs VP Product fractional remote` |
| Indeed | `site:indeed.com [query]` | `site:indeed.com VP Product startup` |
| Wellfound | `site:wellfound.com [query]` | `site:wellfound.com Head of Product Series A` |
| Otta | `site:app.otta.com [query]` | `site:app.otta.com product lead` |
| Product Hunt | `site:producthunt.com/jobs [query]` | `site:producthunt.com/jobs VP Product` |

---

## Fallbacks

If config has no Job Boards table: use the table above as default sources.

If search returns few results: try broader query (drop location, use single role term).
