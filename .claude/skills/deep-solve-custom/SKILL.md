---
name: deep-solve-custom
description: Structured 7-phase problem-solving for complex, multi-step work. Use when: troubleshooting, debugging, design, refactoring, planning, or any task requiring multiple files or steps.
---

# Deep Solve

Structured problem-solving framework: Observe, Think, Plan, Build, Execute, Verify, Learn. Transitions from current state to ideal state via verifiable criteria.

## When to Use

- Troubleshooting or debugging across multiple components
- Design or architecture decisions
- Refactoring with unclear scope
- Complex planning with many dependencies
- Multi-file or multi-step work where structure prevents drift

## The 7 Phases

```
OBSERVE  — What do we actually have? Reverse-engineer the request and context.
THINK    — What is the ideal end state? Define verifiable criteria (ISC).
PLAN     — What sequence gets us there? Break into atomic steps.
BUILD    — Create or modify artifacts. Implement the plan.
EXECUTE  — Run, test, validate. Confirm each criterion.
VERIFY   — Did we meet all criteria? What is still missing?
LEARN    — What would we do differently? Capture for next time.
```

## Workflow

### Phase 1: OBSERVE
- Reverse-engineer the request: explicit wants, implied wants, explicit not-wanted, implied not-wanted
- Gather context: read relevant files, understand current state
- Identify common gotchas and previous work
- **Output:** Clear problem statement and current state summary

### Phase 2: THINK
- Define Ideal State Criteria (ISC): atomic, verifiable, binary testable
- Each criterion = one thing that can be checked (pass/fail)
- Split compound criteria: if it contains "and" or can fail in two ways, make two criteria
- **Output:** List of 8-16 atomic criteria (or more for complex work)

### Phase 3: PLAN
- Sequence steps to satisfy each criterion
- Identify dependencies and order
- Flag risks or unknowns
- **Output:** Ordered step list with dependencies noted

### Phase 4: BUILD
- Execute each step from the plan
- Create or modify files as needed
- Track progress against criteria

### Phase 5: EXECUTE
- Run tests, commands, validations
- Confirm each criterion is met
- Note any deviations from plan

### Phase 6: VERIFY
- Check every ISC: pass or fail?
- List any unmet criteria
- Summarize what was delivered

### Phase 7: LEARN
- What would we do differently?
- Any patterns worth capturing in `06-Resources/Identity/Wisdom.md`?
- Optional: suggest a Session Learning entry

## Output Format

At each phase transition, output a header:

```
━━━ OBSERVE ━━━ 1/7
...
━━━ THINK ━━━ 2/7
...
```

Final deliverable includes:
- Summary of what was done
- Verification checklist (all ISC pass/fail)
- Any learnings captured

## Identity Context

Before OBSERVE, optionally load `06-Resources/Identity/Beliefs.md` and `06-Resources/Identity/Challenges.md`. Use them to inform ideal state (e.g., solutions that align with beliefs) and to flag challenges that might block progress.

## Criterion Quality

**Good ISC:**
- "Login form validates email format before submit"
- "API returns 404 when resource does not exist"
- "README includes setup instructions"

**Bad ISC (split these):**
- "Login form validates and shows error messages" (two criteria)
- "All tests pass" (enumerate which tests)
- "Documentation is complete" (define "complete")

## Effort Tiers

| Tier | When | Criteria Range |
|------|------|----------------|
| Standard | Normal request | 8-16 |
| Extended | Quality must be high | 16-32 |
| Deep | Complex design | 40-80 |

Select tier based on request complexity. More criteria = more rigor.
