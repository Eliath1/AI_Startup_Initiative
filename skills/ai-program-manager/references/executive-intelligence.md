# Executive Intelligence & Reporting — Full Framework

*Loaded by the core skill when preparing an actual executive summary or ROI analysis.*

---

## C-Suite brief vs this document

| Output | When | Template |
|--------|------|----------|
| **C-Suite Executive Brief** (1–2 pages) | VP/C-staff decision memo; portfolio snapshot | `c-suite-executive-brief.md` + `executive-brief-pdf.css` |
| **Portfolio executive summary** (board / steering pack) | Full ROI, governance, alignment | This file — 8-section structure below |
| **Operational / PM report** | Middle management, delivery leads | Issue-level status — not an executive brief |

For **Achievements → Business Value → Risk & Mitigation → Decisions Required**, always use
`c-suite-executive-brief.md`. Do not paste the 8-section format into a 1-page PDF.

---

## What Executives Actually Need to Know

C-suite and VP-level executives arrive at a portfolio review with four unstated questions:
1. **Am I going to be surprised?** (Risk radar — what don't I know that could hurt me?)
2. **Is the money working?** (ROI trajectory — are we getting value for spend?)
3. **Do I need to do anything?** (Decision demand — what requires my authority?)
4. **Is the team in control?** (Confidence signal — do I trust this is being managed?)

Every executive summary must answer all four — explicitly or implicitly — before the exec asks.
If they have to ask, the report failed.

## Executive Cognitive Load Rules
- Executives process information in layers: headline → implication → action. Present in that order.
- One paragraph of context, one insight, one recommendation. Repeat per section.
- Red flags appear first, not last — never build up to bad news.
- Numbers without context are noise: "$400K saved" means nothing without "against $850K expected."
- Percentages without absolutes mislead: "20% delayed" could mean 1 of 5, or 40 of 200.

---

## The Executive Summary — Full Structure

**Cadence**: per the organization's configured cadence (see core skill config) + every explicit request

**Subject line**: `[AI Portfolio Update] Week of [DATE] — [ON TRACK / AT RISK / BLOCKED]`

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PORTFOLIO EXECUTIVE SUMMARY — Week of [YYYY-MM-DD]
Prepared by: AI Program Manager
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EXECUTIVE HEADLINE
[One sentence. The single most important thing this week. Not a summary — a statement.]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. PORTFOLIO HEALTH                                    🟢/🟡/🔴 [Status]
   [2–3 sentences: state of portfolio, trajectory, confidence level]
   Drivers: [top 2–3 factors determining status]

2. BUSINESS VALUE & ROI
   Total Portfolio Investment (YTD): [currency][X]
   Expected Annualised Value:        [currency][X]
   Realized Value (YTD):             [currency][X] ([X]% of plan)
   Value at Risk:                    [currency][X] ([which initiatives, why])
   ROI Trajectory: [Improving / Stable / Deteriorating]
   Insight: [1–2 sentences — is the portfolio generating the return the business case promised?
             If not, what is the gap and what drives it?]

3. STRATEGIC ALIGNMENT
   Alignment Score: [High / Medium / Low]
   Initiatives aligned to current strategic priorities: [N of N]
   Scope drift detected: [Yes — details / No]
   Insight: [Are we still solving the right problems? Have priorities shifted?]

4. RISK LANDSCAPE
   Overall Risk Level: [Critical / Elevated / Managed]
   ┌─────────────────────────────────────────────────────┐
   │ ID     Risk                  Severity  Velocity  Owner    │
   │ R-### [Description]         [C/H/M/L] [↑↔↓]    [Role]   │
   └─────────────────────────────────────────────────────┘
   Top Risk Insight: [the single risk requiring executive attention, and why]
   Compliance/InfoSec Status: [Clean / Gaps identified — see Section 6]

5. EXECUTION PERFORMANCE
   On-Track:  [N] initiatives | At-Risk: [N] | Blocked: [N] | Completed: [N]
   Sprint/Milestone compliance rate: [X]%
   Key delay root causes: [structural issue, not a list of excuses]
   Recoverable this cycle: [Yes/Partial/No — what changes to make it yes]

6. GOVERNANCE & DATA INTEGRITY
   Execution ↔ Documentation alignment: [X]% ([N] discrepancies found)
   Critical discrepancies: [list or "None"]
   Missing compliance documentation: [list or "None"]
   Intake SLA compliance: [X]% | Decisions pending >7bd: [N]
   Governance maturity signal: [Improving / Stable / Degrading]

7. KEY DECISIONS REQUIRED
   [Only escalate what requires executive authority — no operational decisions here]
   ┌──────────────────────────────────────────────────────────┐
   │ D-### [Decision]    Owner    Deadline    Consequence if delayed │
   └──────────────────────────────────────────────────────────┘

8. RECOMMENDED ACTIONS (Prioritized)
   P1 [IMMEDIATE — this week]: [Action] — [Owner] — [Deadline]
   P2 [THIS MONTH]: [Action] — [Owner] — [Deadline]
   P3 [THIS QUARTER]: [Action] — [Owner] — [Deadline]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Next report: [date] | Questions: [contact]
Documentation archive: YYYY-MM-DD Weekly Status Report
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## ROI Analysis Framework

**Inputs required**: budget spent YTD · headcount cost · vendor/tool costs · opportunity cost of delayed delivery

**Formula**: (Realized Value − Total Investment) / Total Investment × 100 = ROI%

**Value realization categories**:
- Hard savings: measurable cost reduction (headcount, vendor spend, rework elimination)
- Revenue protection: prevented revenue loss or churn
- Revenue generation: new revenue directly attributable to the AI capability
- Efficiency gain: FTE hours saved × fully-loaded cost rate
- Risk mitigation value: cost of the risk event × probability reduction

**Presentation rule**: always show Expected vs. Realized vs. At Risk as three distinct numbers.
Never blend them — executives need the gap and the exposure separately.

**Value at Risk calculation**: identify initiatives with delivery risk → estimate % of business
case value at risk per initiative → sum weighted by probability of non-delivery → flag separately
from unrealized-but-on-track value.

---

## Scenario Narrative Examples

**Green (on track)**: *"Portfolio is delivering against plan. Three initiatives shipped this
month, realizing [currency]X of the [currency]Y projected annual value. No critical
discrepancies. Recommend: proceed with Stage 2 scoring for two new intake requests."*

**Amber (at risk, recoverable)**: *"Two initiatives are tracking 3 weeks behind milestone plan
due to a shared data-pipeline dependency. Recoverable this cycle if the dependency is
resourced by [date] — decision required from [role] this week."*

**Red (blocked, needs escalation)**: *"[Initiative] is blocked on an unresolved compliance gap
identified during this week's audit — [specific gap]. This is a Critical discrepancy and cannot
proceed to further development until resolved. Escalating to Steering Committee for a go/no-go
decision by [date]."*
