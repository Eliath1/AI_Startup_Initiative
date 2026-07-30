# Maturity Assessment Framework & Discovery Question Bank

*Loaded when running an actual Stage 1 assessment or Stage 2 discovery session.*

---

## Maturity Stages

| Stage | Characteristics | Typical Next Move |
|---|---|---|
| **None** | No AI initiatives, possibly informal individual tool use (ChatGPT, Copilot) with no policy | Start with 1 low-risk, high-value pilot + a basic acceptable-use policy |
| **Experimental** | 1–3 pilots running, no shared governance, each initiative reinvents process | Stand up minimal governance (intake + scoring) before adding more pilots |
| **Scaling** | Governance model exists, multiple concurrent initiatives, some measured value | Focus on portfolio-level ROI tracking, formalize the operating cadence |
| **Embedded** | AI initiatives evaluated alongside all other investment, dedicated function/team exists | Focus shifts to optimization, advanced use cases, org-wide capability building |

## Five-Dimension Scoring (1–5 each, for internal use — don't necessarily show raw score to client, use it to shape narrative)

**1. Data Readiness**
- 1: Data is siloed, unclean, or inaccessible without significant engineering work
- 3: Data exists and is accessible but requires meaningful preparation per use case
- 5: Clean, governed, accessible data with existing pipelines

**2. Tooling & Infrastructure**
- 1: No enterprise AI tooling licensed or approved
- 3: Some tools licensed (Copilot, ChatGPT Enterprise) but unmanaged/ungoverned usage
- 5: Deliberate tooling stack with clear ownership and integration into existing systems

**3. Talent & Skills**
- 1: No internal AI/ML capability, no vendor relationships
- 3: Some internal enthusiasm/self-taught capability, no dedicated resourcing
- 5: Dedicated internal capability or a mature, trusted partner relationship

**4. Governance & Risk Appetite**
- 1: No risk/compliance function has considered AI at all
- 3: General risk/compliance function exists but hasn't adapted to AI-specific questions
- 5: AI-specific governance considerations are already part of the risk framework

**5. Cultural Readiness**
- 1: Single enthusiastic individual, no broader buy-in
- 3: Leadership interest exists but hasn't translated into resourcing or mandate
- 5: Leadership-sponsored initiative with clear mandate and realistic expectations

---

## Discovery Question Bank (use-case identification)

**Opening framing questions**:
- "Where does work get stuck or slow down that shouldn't?"
- "What decisions get made on incomplete information because getting complete information takes too long?"
- "What does your team spend time on that feels like it shouldn't require a person?"
- "Where have competitors or peers visibly moved faster because of a capability you don't have?"

**Value-sizing follow-ups** (for each candidate use case surfaced):
- "How is this done today, and what does it cost — in time, money, or error rate?"
- "If this were 80% automated, what would that be worth, concretely?"
- "What happens if we don't do anything about this for another 12 months?"

**Feasibility follow-ups**:
- "Does the data this would need already exist somewhere, and can we get to it?"
- "Has anyone tried something like this before here, and what happened?"
- "Who would need to be involved to actually ship this, and are they available?"

**Risk-surfacing questions** (ask even if not volunteered):
- "Does this touch customer data, employee data, or any regulated information?"
- "Could this make a decision that affects someone's employment, credit, or legal standing?"
- "What's the worst plausible outcome if this is wrong 5% of the time?"

---

## Prioritization Matrix (plot each candidate)

```
High Value  │  🎯 PRIORITIZE      │  📋 ROADMAP
            │  (do first)         │  (do after quick wins)
            │─────────────────────┼──────────────────────
Low Value   │  ❌ DEPRIORITIZE    │  🤔 RECONSIDER SCOPE
            │  (don't do)         │  (can it be simplified?)
            └─────────────────────┴──────────────────────
              Low Complexity         High Complexity
```

First-wave selection should draw exclusively from the top-left quadrant unless there's a
compelling strategic reason (e.g., competitive necessity) to accept complexity early.
