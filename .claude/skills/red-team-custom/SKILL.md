---
name: red-team-custom
description: Stress-test ideas, find fatal flaws, play devil's advocate. Use when: red team, attack idea, counterarguments, critique, stress test, poke holes, find weaknesses, break this, adversarial validation.
---

# Red Team

Adversarial analysis to destroy weak arguments and surface fatal flaws. Produces steelman (strongest version) plus counter-argument.

## When to Use

- Attack an architecture proposal before committing
- Stress-test a business decision or pricing change
- Poke holes in a plan before presenting it
- Validate that an idea survives scrutiny

## Workflow

### 1. Decomposition
Break the argument or plan into atomic claims. List each claim separately.

### 2. Adversarial Analysis
For each claim, ask:
- What would an opponent say?
- What evidence would falsify this?
- What assumption is hidden here?
- What is the weakest link?

### 3. Steelman
Write the strongest, most charitable version of the argument. Address obvious weaknesses; assume best intent.

### 4. Counter-Argument
Write the strongest rebuttal. Target the steelman, not a strawman. Aim for 6-8 substantive points.

### 5. Synthesis
Identify the ONE core issue that could collapse the plan. Surface it clearly.

## Output Format

```markdown
## Red Team Analysis: [Topic]

### Steelman (Strongest Version)
[4-8 bullet points: best possible articulation of the argument]

### Counter-Argument
[6-8 bullet points: strongest rebuttal to the steelman]

### Fatal Flaw
[One sentence: the single issue that could collapse this. Or "No fatal flaw identified."]

### Recommendations
[What to strengthen, validate, or revisit before proceeding]
```

## Identity Context

Optionally load `06-Resources/Identity/Beliefs.md` and `06-Resources/Identity/Challenges.md` if the user has them. Stress-test whether the plan aligns with stated beliefs and whether it addresses known challenges.

## vs Council

- **Red Team** — Purely adversarial. Attack the idea. Find weaknesses.
- **Council** — Collaborative debate. Multiple perspectives to find the best path.

Use Red Team when you need to break something. Use Council when you need to deliberate.
