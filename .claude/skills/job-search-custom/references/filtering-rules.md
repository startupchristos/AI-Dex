# Filtering Rules

How to score, rank, and deduplicate job search results. Load when config is incomplete or user asks for advanced filtering.

---

## Exclusion Rules

**Hard exclude:** Remove result if title or snippet contains any Keywords (exclude):
- entry-level, junior, internship, associate (unless "Senior Associate" or similar), coordinator

**Soft exclude:** Downgrade to Low match if:
- "on-site only" and user prefers remote/hybrid
- "relocation required" and user excludes that
- Company size < 10 (unless user explicitly wants early-stage)

---

## Ranking Logic

**High match:**
- Title contains exact or close Target Role (VP Product, Head of Product, Operating Partner, Fractional CPO)
- Contains 1+ Keywords (include)
- Location matches (remote, hybrid, or acceptable cities)
- Industry in Industries list

**Medium match:**
- Title is adjacent role (Senior PM, Director of Product) with senior scope
- Industry match
- Partial keyword match

**Low match:**
- Broader PM roles, advisory-adjacent
- Include only if user wants broad results

---

## Deduplication

- Same URL → keep first, drop rest
- Same company + same role title → keep first (may be repost)
- Same company + different role → keep both
