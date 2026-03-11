# Promotion Assessment Template

Use this structure when generating Mode 4 output.

**MCP Tools (call before generating):**
- Career MCP: `scan_evidence()`, `parse_ladder()`, `analyze_coverage()`, `timeline_analysis()`, `scan_work_for_evidence(date_range: "last-12-months", impact_level: "high")`
- Work MCP: `get_quarterly_goals()` for recent quarters, `get_goal_status(goal_id)` for each goal

**Structure:**
```markdown
# Promotion Assessment — [TARGET ROLE]

**Current Role:** [CURRENT LEVEL]
**Target Role:** [TARGET LEVEL]
**Assessment Date:** YYYY-MM-DD

---

## Executive Summary

[2-3 paragraphs: overall readiness assessment, strongest areas, key gaps to address]

---

## Competency Gap Analysis

### [Competency Category 1]

#### Requirement: [What target role requires]

**Current Demonstration:**
- ✅ [Evidence of meeting this requirement]
- ✅ [Evidence of meeting this requirement]
- ⚠️ [Partial evidence / room for more]

**Gap Assessment:** [None / Minor / Moderate / Significant]

**What's Needed:** [If there's a gap, what additional evidence would strengthen the case]

---

[Repeat for each competency category]

---

## Strengths Alignment

These are areas where you're **already operating at the target level:**

1. **[Strength 1]**
   - Evidence: [Examples from work]
   - Ladder match: [How this maps to promotion criteria]

2. **[Strength 2]**
3. **[Strength 3]**

---

## Development Areas

### High Priority

**[Development Area 1]**
- **Why it matters:** [Impact on promotion case]
- **Current state:** [Where you are now]
- **Target state:** [What target level requires]
- **What's missing:** [Specific gap]

### Lower Priority

**[Development Area 3]**
- **Why it matters:** [Impact on promotion case]
- **Current state:** [Where you are now]
- **What's missing:** [Specific gap]

---

## Evidence Needed

To strengthen your promotion case, focus on capturing:

1. **[Evidence Type 1]** — [Why this matters, how to capture it]
2. **[Evidence Type 2]** — [Why this matters, how to capture it]
3. **[Evidence Type 3]** — [Why this matters, how to capture it]

---

## Readiness Assessment

**Overall Promotion Readiness:** [Not Ready / Developing / Nearly Ready / Ready]

**Rationale:**
[Detailed explanation of readiness level based on competency analysis]

**Confidence Level:** [Low / Medium / High]

**Key Considerations:**
- [Factor 1 influencing readiness]
- [Factor 2 influencing readiness]
- [Factor 3 influencing readiness]

---

## Action Plan

### Immediate Actions (This Quarter)

1. **[Action 1]**
   - What: [Specific activity]
   - Why: [Which gap it addresses]
   - How to measure: [Success criteria]

2. **[Action 2]**
3. **[Action 3]**

### Next 6 Months

- [Longer-term development action 1]
- [Longer-term development action 2]
- [Longer-term development action 3]

### Promotion Timeline

**Realistic Timeline:** [Estimated timeframe]

**Factors:**
- [Factor influencing timeline]
- [Factor influencing timeline]

---

## Conversation Prep

When discussing promotion with your manager, emphasize:

1. **[Talking Point 1]** — [Your strongest evidence]
2. **[Talking Point 2]** — [Growth you've demonstrated]
3. **[Talking Point 3]** — [Commitment to closing gaps]

**Questions to Ask Your Manager:**
- [Question 1 about their assessment of your readiness]
- [Question 2 about specific gaps they see]
- [Question 3 about timeline and next steps]

---

## Supporting Evidence

[Reference specific files in `05-Areas/Career/Evidence/` that demonstrate competency]

---

*This assessment is based on your career ladder and evidence captured in Dex. Discuss with your manager to validate and refine.*
```

**After generating:** Save to `05-Areas/Career/Assessments/YYYYMMDD - Promotion Assessment.md`. Suggest: review with manager, focus on high-priority development areas, capture evidence proactively, re-run quarterly.
