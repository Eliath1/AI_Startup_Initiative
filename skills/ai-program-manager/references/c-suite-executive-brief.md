# C-Suite Executive Brief — Template & Rules

*Use this format for VP / C-staff readers. Target **1 page**, hard cap **2 pages**.  
For multi-initiative board packs with governance depth, use `executive-intelligence.md` (8-section portfolio format).  
For PM / director operational status, use delivery-manager templates — not this brief.*

---

## When to Use

- Portfolio or program update for **executives who will spend under 2 minutes** reading
- Outputs from Jira, CRM, CapEx, or AI value logs consolidated for **decision**, not diagnosis
- PDF or one-page memo handoff to steering committee or C-suite

## Page Budget

| Section | Target space |
|---------|----------------|
| Title + date line | 2–3 lines only |
| 1. Achievements | ¼ page (3–4 titled bullets with one sentence each) |
| 2. Business Value & Value Realization | ¼ page (one glance table + optional ROI line) |
| 3. Risk & Mitigation | ¼ page (max 4 rows) |
| 4. Decisions Required | ¼ page (max 3 decisions) |
| Metadata (appendix) | End of document only; never above section 1 |

## Header Rule (PDF / Markdown)

**Above the fold — only:**

```markdown
# [Portfolio or Program Name] — Executive Brief
**Date:** [YYYY-MM-DD] · **Reporting period:** [range]
```

**Move to end under `## Document metadata`:**

- Audience  
- Sources analyzed  
- Method / data lineage  
- Analyst contact (optional)

Do **not** list sources, methods, or audience under the title — it wastes the first screen on PDF.

## Typography (PDF)

- Body: **9–9.5pt** sans-serif (Segoe UI, Calibri)
- Title: **16–18pt** (not 22pt)
- Section headings: **11pt** bold, brand/accent color
- Tables: **8.5–9pt**, tight padding (4px), no repeated narrative in cells
- Margins: **0.5–0.6in**
- `@page`: letter; avoid page breaks inside tables

---

## Required Structure (exactly four sections)

### 1. Achievements

Format: **Title** (achievement theme) + **body** (one or two sentences max per item).

Rules:

- 3–4 achievements only; each must tie to **outcome**, not activity
- No issue keys in the headline; optional `(APEX-204)` at end of body if traceability needed
- Lead with the highest business impact (revenue, validated savings, production AI)

```markdown
## 1. Achievements

**[Achievement title]**  
[One–two sentences: what was delivered and why it matters to the business.]

**[Achievement title]**  
[Body.]
```

### 2. Business Value & Value Realization

Purpose: **numbers at a glance** — no paragraphs before the table.

Rules:

- One primary KPI table (5–8 rows max)
- Show **Expected / Actual / Δ or % of plan** where possible — never a lone dollar figure
- Optional second row block: **Investment | Realized value | Net ROI %** (single line or 3-column mini-table)
- Omit Jira counts, sprint metrics, and transaction-level detail

```markdown
## 2. Business Value & Value Realization

| Measure | Actual | vs. Plan / Baseline | Signal |
|---------|-------:|---------------------|--------|
| ... | ... | ... | 🟢 / 🟡 / 🔴 |
```

### 3. Risk & Mitigation Summary

Rules:

- Max **4** risks; sort by **executive exposure** (financial, reputational, regulatory)
- Every row must include **mitigation** — no risk-only lists
- Severity: Critical / Elevated / Managed (or 🟢🟡🔴)

```markdown
## 3. Risk & Mitigation Summary

| Risk | Impact if unaddressed | Mitigation | Status |
|------|------------------------|------------|--------|
```

### 4. Decisions Required

Rules:

- **Only** items needing VP+ or C-level authority (budget, policy, escalation, go/no-go)
- Max **3** decisions; each with **recommended option**, **owner**, **deadline**
- State **consequence of delay** in one phrase

```markdown
## 4. Decisions Required

| # | Decision | Recommendation | Owner | By | If delayed |
|---|----------|----------------|-------|-----|------------|
```

---

## What Not to Include (C-Suite Brief)

- Program deep dives, milestone lists, assignee names
- Monthly trend appendices (offer separately as operational pack)
- Worklog excerpts, Git commits, JSON field names
- “Upcoming priorities” laundry lists — fold into Decisions or drop

---

## Operational vs Executive (classification)

| Audience | Template |
|----------|----------|
| C-suite / VP | This file (`c-suite-executive-brief.md`) |
| Director / delivery manager | `ai-weekly-executive-reports.mdc` status overview (lighter than PM pack) |
| PM / team | Issue-level status; Jira keys; blockers by assignee |
| Board / full portfolio | `executive-intelligence.md` 8-section summary |

---

## PDF Generation Checklist

1. Render Markdown → HTML with **compact** stylesheet (see `executive-brief-pdf.css` in this folder).
2. Print via headless browser (`--print-to-pdf`, `--no-pdf-header-footer`).
3. Verify: section 1 starts on page 1; total length ≤ 2 pages.
4. Metadata section appears on page 2 or end of page 1 only — never page 1 header block.
