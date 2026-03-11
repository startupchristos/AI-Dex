---
name: job-search-custom
description: Search for job openings matching your criteria across multiple internet sources. Use when: (1) Starting a job search session, (2) Refreshing the pipeline with new postings, (3) Searching specific sources or roles, or (4) Before running /job-opportunity on a specific role. Loads Job-Search-Resources.md and Job-Search-Criteria.md, runs WebSearch per source, filters results, and outputs ranked list.
---

# Job Search

Find job openings across configured sources that match your criteria. Integrates with `/job-opportunity` for full analysis of any role.

## Required Context

**Load at start:**
1. `05-Areas/PPM-Career/Professional-Development/Job-Search/Job-Search-Resources.md` — Where to search
2. `05-Areas/PPM-Career/Professional-Development/Job-Search/Job-Search-Criteria.md` — What to filter for

**Optional:**
- `05-Areas/PPM-Career/Identity-and-Positioning/Positioning-and-Targets.md` — For alignment when filtering (Tier 1/2/3)

---

## Process

### Step 1: Load Config

Read both config files. If either is missing, create them with starter content from the plan. Confirm with user before proceeding.

### Step 2: Build Search Queries

From Job-Search-Criteria.md:
- Combine **Target Roles** (primary) with **Keywords (include)** for query construction
- Add **Location** terms (e.g., "remote", "hybrid") if relevant
- Add **Industries** if narrowing (e.g., "HealthTech")

**Query format:** `[role] [keywords] [location]` — e.g., `VP Product fractional remote` or `Operating Partner portfolio post-investment`

Build 2–3 query variants to maximize coverage (e.g., different role phrasings).

### Step 3: Search Each Source

For each row in Job-Search-Resources.md Job Boards table:
1. Take the Search Strategy (e.g., `site:linkedin.com/jobs [query]`)
2. Replace `[query]` with each constructed query
3. Run **WebSearch** with the full query
4. Parse results: extract title, company, URL, snippet from each result

**Rate limiting:** Run 2–3 searches per source, then move to next. Avoid overwhelming with too many requests.

### Step 4: Filter Results

Apply Job-Search-Criteria.md filters:
- **Exclude:** Any result containing Keywords (exclude) → filter out
- **Location:** If result mentions "on-site only" or "relocation required" and user excludes those → filter out
- **Relevance:** Rank by match to Target Roles and Keywords (include)

**Deduplicate:** Same URL or same company+role appearing multiple times → keep one.

### Step 5: Rank and Output

**High match:** Title matches Target Role, contains include keywords, location acceptable
**Medium match:** Partial role match or relevant industry
**Low match:** Adjacent roles (e.g., "Senior PM" when targeting "VP Product") — include only if user explicitly wants broad results

Output format:

```markdown
## Job Search Results — [date]

### High match
1. **[Role]** @ [Company] — [snippet]
   [URL]
2. ...

### Medium match
...

### Pass to /job-opportunity
Paste any URL above to run full analysis.
```

### Step 6: Save and Handoff

- **Offer to save:** `05-Areas/PPM-Career/Professional-Development/Job-Search/Search-Results/YYYYMMDD - Job-Search-Results.md`
- **Handoff:** "Run `/job-opportunity` with [URL] to analyze this role."

---

## Integration

- **`/job-opportunity`** — Handles evaluation of a specific role once found; job-search feeds it
- **`/career-coach`** — Internal development; job-search is for external opportunities

---

## Notes

- Custom skill, protected from Dex updates
- Edit Job-Search-Resources.md and Job-Search-Criteria.md to change sources and criteria
- For advanced search strategies or filtering logic, load `references/search-strategies.md` or `references/filtering-rules.md` if they exist
