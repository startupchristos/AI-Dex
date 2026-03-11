---
name: first-principles-custom
description: Decompose to axioms, challenge inherited assumptions, reconstruct from verified truths. Use when: first principles, fundamental, root cause, decompose, challenge assumptions, rebuild from scratch.
---

# First Principles

Foundational reasoning methodology. Deconstructs problems to fundamental truths rather than reasoning by analogy.

## When to Use

- **Architects:** Challenge "is this actually a constraint or just how we have always done it?"
- **Product/Strategy:** When stuck, rebuild from fundamentals
- **Any skill:** When inherited assumptions may be limiting the solution space

## The 3-Step Framework

```
STEP 1: DECONSTRUCT
"What is this really made of?"
Break down to constituent parts and fundamental truths
                    ↓
STEP 2: CHALLENGE
"Is this a real constraint or an assumption?"
Classify each element as hard/soft constraint
                    ↓
STEP 3: RECONSTRUCT
"Given only the truths, what is optimal?"
Build new solution from fundamentals, ignoring form
```

## Key Questions

### Deconstruction
- What is this actually made of?
- What are the constituent parts?
- What is the actual cost/value of each part?

### Challenge
- Is this a hard constraint (physics/reality) or soft constraint (policy/choice)?
- What if we removed this constraint entirely?
- What evidence supports this assumption?

### Reconstruction
- If we started from scratch with only the fundamental truths, what would we build?
- What field has solved an analogous problem differently?
- Are we optimizing function or form?

## Constraint Classification

| Type | Definition | Example | Can Change? |
|------|------------|---------|-------------|
| **Hard** | Physics/reality | "Data cannot travel faster than light" | No |
| **Soft** | Policy/choice | "We always use REST APIs" | Yes |
| **Assumption** | Unvalidated belief | "Users will not accept that UX" | Maybe false |

**Rule:** Only hard constraints are truly immutable. Soft constraints and assumptions should be challenged.

## Identity Context

Before analysis, optionally load `06-Resources/Identity/Beliefs.md` and `06-Resources/Identity/Challenges.md` if the user has them. Challenge assumptions against stated beliefs and consider tracked challenges when reconstructing.

## Output Format

```markdown
## First Principles Analysis: [Topic]

### Deconstruction
- **Constituent Parts:** [List fundamental elements]
- **Actual Values:** [Real costs/metrics, not market prices]

### Constraint Classification
| Constraint | Type | Evidence | Challenge |
|------------|------|----------|-----------|
| [X] | Hard/Soft/Assumption | [Why] | [What if removed?] |

### Reconstruction
- **Fundamental Truths:** [Only the hard constraints]
- **Optimal Solution:** [Built from fundamentals]
- **Form vs Function:** [Are we optimizing the right thing?]

### Key Insight
[One sentence: what assumption was limiting us?]
```

## Principles

1. **Physics First** — Real constraints come from physics/reality, not convention
2. **Function Over Form** — Optimize what you are trying to accomplish, not how it is traditionally done
3. **Question Everything** — Every assumption is guilty until proven innocent
4. **Rebuild, Do Not Patch** — When assumptions are wrong, start fresh rather than fixing

## Anti-Patterns to Avoid

- **Reasoning by Analogy:** "Company X does it this way, so should we"
- **Accepting Market Prices:** "Batteries cost $600/kWh" without checking material costs
- **Form Fixation:** Improving the suitcase instead of inventing wheels
- **Soft Constraint Worship:** Treating policies as physics
