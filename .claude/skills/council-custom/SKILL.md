---
name: council-custom
description: Multi-perspective debate with visible discussion. Use when: council, debate, perspectives, weigh options, deliberate, multiple viewpoints, collaborative-adversarial discussion.
---

# Council

Multi-perspective debate where different expert "voices" discuss a topic and respond to each other. Collaborative-adversarial: debate to find the best path, not to attack.

## When to Use

- Weigh options (e.g., "Should we use WebSockets or SSE?")
- Deliberate on important decisions
- Sanity-check a design or approach
- Surface insights through intellectual friction

## vs Red Team

- **Council** — Collaborative-adversarial. Experts respond to each other to find the best path.
- **Red Team** — Purely adversarial. Attack the idea. Find fatal flaws.

## Workflow

### Option A: Quick Council (1 round)
Fast perspective check. Each voice gives initial position. Use for sanity checks.

### Option B: Full Debate (3 rounds)
1. **Round 1:** Each voice states initial position and reasoning
2. **Round 2:** Each voice responds to at least one other voice's point
3. **Round 3:** Each voice updates position or concedes; identify convergence

### Voice Selection

Pick 3-4 perspectives relevant to the topic:

| Domain | Example Voices |
|--------|----------------|
| Technical | Engineer, Architect, Security |
| Product | PM, Designer, User Advocate |
| Business | Strategy, Ops, Finance |
| Career | Advisor, Skeptic, Champion |

## Output Format

```markdown
## Council: [Topic]

### Round 1
**[Engineer]:** [Position + reasoning]
**[Architect]:** [Position + reasoning]
**[Security]:** [Position + reasoning]

### Round 2
**[Engineer]** responds to [Architect]: [Response]
**[Architect]** responds to [Security]: [Response]
...

### Round 3
**[Engineer]:** [Updated position]
**[Architect]:** [Updated position]
...

### Synthesis
**Convergence:** [Where voices agreed]
**Remaining Tension:** [Where they differ and why]
**Recommendation:** [Suggested path with rationale]
```

## Identity Context

Optionally load `06-Resources/Identity/Beliefs.md`, `06-Resources/Identity/Challenges.md`, and `06-Resources/Identity/Wisdom.md` if the user has them. Use beliefs and wisdom to ground one or more council voices.

## Best Practices

1. Use Quick Council for sanity checks; Full Debate for important decisions
2. Add domain-specific experts as needed (e.g., Security for auth design)
3. Review the transcript — insights are in the responses, not just positions
4. Trust multi-agent convergence when it occurs
