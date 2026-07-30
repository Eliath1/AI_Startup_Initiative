---
name: ai-weekly-executive-reports
version: 1.0
description: >
  Generates recurring executive/board-level status reports for AI portfolios or individual
  initiatives, from whatever project data source is available (Jira, Asana, Notion, spreadsheet,
  or manual input). Use for weekly status reports, executive summaries, board updates, RAG
  status reports, or portfolio scorecards. Source-agnostic — does not assume any specific PM tool.
---

# AI Weekly Executive Reports

### Configuration
```yaml
organization_name: "{{ORGANIZATION_NAME}}"
report_cadence_day: "{{REPORT_CADENCE_DAY}}"      # e.g. "Monday"
report_cadence_time: "{{REPORT_CADENCE_TIME}}"    # e.g. "10 AM"
audience: "{{AUDIENCE}}"                           # e.g. "C-Suite + Steering Committee"
currency: "{{CURRENCY}}"
data_source: "{{DATA_SOURCE}}"                     # e.g. "Jira + Confluence", "Notion", "manual spreadsheet"
```

---

## Purpose

Turns raw project status — wherever it lives — into a report an executive can act on in under
two minutes. This is the standalone version of the reporting engine also used inside
`ai-program-manager`; use this skill directly when the need is just "produce this week's report"
without the full governance/audit apparatus.

## Core Principle: Four Unstated Questions

Every executive reads a status report looking for answers to four questions, whether or not
they're asked explicitly:
1. **Am I going to be surprised?** — risk radar
2. **Is the money working?** — value/ROI trajectory
3. **Do I need to do anything?** — decisions requiring their authority
4. **Is the team in control?** — confidence signal

If the report doesn't answer all four, it hasn't done its job — regardless of how much detail it contains.

## Cognitive Load Rules
- Headline → implication → action, in that order, every section
- Bad news first — never build up to it
- Numbers need context: a figure alone is noise ("$400K saved" means nothing without "against $850K expected")
- One insight per paragraph, not a wall of updates

---

## Data Collection

Before drafting, gather (ask explicitly if not provided — never fabricate status):
- Current status of each active initiative (on-track / at-risk / blocked / completed)
- Any milestone changes since the last report
- New or escalated risks
- Budget/spend data if value reporting is in scope
- Any decisions currently pending executive input

If the configured `data_source` is directly accessible (via connected tools), pull it live rather
than asking — see `connector-readiness-assessor` if the relevant tool isn't yet connected.

---

## Report Template

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[ORGANIZATION_NAME] — Weekly Status | [YYYY-MM-DD] — [ON TRACK / AT RISK / BLOCKED]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

HEADLINE
[One sentence — the single most important thing this week]

1. STATUS OVERVIEW                                    🟢/🟡/🔴
   On-Track: [N] | At-Risk: [N] | Blocked: [N] | Completed: [N]
   [2–3 sentence narrative on overall trajectory]

2. THIS WEEK'S CHANGES
   [What moved since last report — new risks, resolved blockers, milestone shifts]

3. RISKS REQUIRING ATTENTION
   [Only what's new or escalated — don't re-list stable, tracked risks every week]

4. DECISIONS NEEDED
   [Only what requires this audience's authority — nothing operational]

5. RECOMMENDED ACTIONS
   P1 (this week) / P2 (this month) — Owner, Deadline

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Next report: [date]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

For portfolio-level (multi-initiative) reports with full ROI/value-at-risk modeling and
board-deck-length detail, use `ai-program-manager`'s `references/executive-intelligence.md` —
this skill's template above is intentionally the lighter, faster, single-report version.

## Delivery
Draft on `{{report_cadence_day}}` before `{{report_cadence_time}}`. Offer both a chat-ready
version and, if requested, hand off to a document/PDF-producing workflow for a shareable file —
PDF export is intentionally out of scope for this skill (see the separate PDF-generation skill,
in progress) and shouldn't be improvised here beyond plain text/markdown output.
