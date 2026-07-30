---
name: executive-dashboard-rendering
version: 1.0
description: >
  Renders world-class executive BI dashboards as semantic HTML with KPI cards, financial formatting,
  charts, insights, risks, and actionable recommendations. Use when building executive dashboards,
  KPI scorecards, Power BI / Tableau-style web views, portfolio health boards, ROI dashboards,
  operational metrics, or converting report data into an interactive HTML dashboard. Optimizes for
  5–10 second executive comprehension—not raw data display.
---

# Executive Dashboard Rendering

### Configuration
```yaml
dashboard_title: "{{DASHBOARD_TITLE}}"
organization_name: "{{ORGANIZATION_NAME}}"
period_label: "{{PERIOD_LABEL}}"              # e.g. "Q2 FY2026"
last_updated: "{{LAST_UPDATED_ISO}}"
logo_url: "{{LOGO_URL}}"                      # optional
theme: "{{THEME}}"                            # light | dark
primary_color: "{{PRIMARY_COLOR}}"
secondary_color: "{{SECONDARY_COLOR}}"
accent_color: "{{ACCENT_COLOR}}"
chart_library: "{{CHART_LIBRARY}}"            # chartjs | echarts | highcharts | d3 | none
locale: "{{LOCALE}}"                          # e.g. en-US
currency: "{{CURRENCY}}"                      # e.g. USD
language: "{{LANGUAGE}}"
sidebar_enabled: false
metric_order: []                              # optional override
sections_enabled: []                          # optional subset of default sections
number_format: "{{NUMBER_FORMAT}}"            # compact | full
```

---

## Purpose

Build reusable, enterprise-grade **HTML executive dashboards** that help leaders answer—in under
10 seconds, without hunting:

1. **What is happening?**
2. **Why is it happening?**
3. **Is it good or bad?**
4. **Where should I focus?**
5. **What action should I take?**

The objective is not simply to display data. Every dashboard must **tell a story**: what happened →
why → business impact → recommendations → next actions.

**Handoff:** `ai-weekly-executive-reports` and `ai-program-manager` produce narrative/status
content; this skill renders that (or structured JSON) as a polished interactive dashboard. For
print/PDF export, pair with `pdf-generation`.

---

## Design philosophy

Aim for the clarity and polish of **Power BI, Tableau, QuickSight, Looker, Stripe Dashboard,
Linear, Notion/Vercel/GitHub Analytics, Datadog, New Relic, Atlassian Analytics**, and modern SaaS
admin panels: **clean, elegant, minimal, data-first**. Avoid visual clutter; every component must
have a purpose.

- No unnecessary gradients, flashy colors, or heavy shadows (subtle elevation only).
- Rounded corners: **8–12px**; consistent spacing and typography.
- Never rely on color alone—pair with icons, labels, or patterns (WCAG).

---

## Default section hierarchy

Render sections in this order (most important **above the fold**):

```
Navigation (optional)
  ↓ Dashboard Title + period + last updated
  ↓ Executive Summary (required)
  ↓ Critical Alerts (when data supports)
  ↓ KPI Cards
  ↓ Financial Metrics
  ↓ Operational Metrics
  ↓ Charts (trends, comparisons)
  ↓ Detailed Analysis
  ↓ Insights
  ↓ Recommendations
  ↓ Supporting Tables
  ↓ Appendix (optional)
```

**Eye-path priority:** Executive Summary → Critical Alerts → KPIs → Financial → Operational →
Trends → Comparisons → Detailed Tables → Raw Data.

Default layout matches the wireframe in [layout-and-hierarchy.md](references/layout-and-hierarchy.md).

---

## Rendering workflow

```
Task Progress:
- [ ] 1. Ingest data (JSON schema, CSV summary, or report markdown—never fabricate metrics)
- [ ] 2. Resolve config (theme, locale, currency, chart library)
- [ ] 3. Compute intelligence layer (highlights, anomalies, ranked priorities, summary text)
- [ ] 4. Build document model (ordered sections + blocks)
- [ ] 5. Generate semantic HTML + CSS (grid layout, components, chart placeholders)
- [ ] 6. Wire charts via chart adapter (library swappable without layout changes)
- [ ] 7. Validate accessibility, responsive breakpoints, and success criteria checklist
- [ ] 8. Deliver HTML file(s) + brief notes (assumptions, data gaps)
```

### Step 1: Data honesty

Ask for missing inputs when needed. Highlight **data gaps** in the UI (muted callout), not invented
numbers.

### Step 3: Dashboard intelligence

When rendering, automatically:

- Highlight unusual values, trends, anomalies, achievements, and risks
- Rank priorities (risks, opportunities)
- Summarize key findings in the **Executive Summary** card
- Populate smart sections when data exists: Top Opportunities, Critical Risks, Anomalies,
  Forecast, Executive Insights, AI Recommendations, Trend/Variance Analysis, Value Drivers,
  Root Cause, Business Impact, Priority Matrix

### Step 5: Technology defaults

- **HTML5**, semantic landmarks (`header`, `nav`, `main`, `section`, `footer`)
- **CSS Grid** (12-col desktop, 6-col tablet, 1-col mobile) + Flexbox for card innards
- **CSS variables** for theme, spacing, typography, status colors
- Optional: Tailwind or Bootstrap only if user requests—default to self-contained CSS modules
- Chart libraries: Chart.js, ECharts, Highcharts, or D3—via adapter pattern in
  [chart-library-adapter.md](references/chart-library-adapter.md)

Start from [base-dashboard-scaffold.html](references/base-dashboard-scaffold.html) when generating
new dashboards; extend, do not fork unrelated layouts per request.

---

## Required: Executive Summary card

Always include a summary card. Example pattern:

> **Quarterly Performance** — Revenue exceeded target by 8%. Operating margin improved 2.1%.
> Customer retention increased. Two critical risks detected. Three recommendations available.

Executives must grasp the report without reading the full dashboard.

---

## Component quick reference

| Block | Requirements |
|-------|----------------|
| KPI card | Title, current, previous, delta, trend arrow, sparkline, status, color + label, short explanation |
| Financial value | Currency, %, M/B compact, negatives, accounting notation, locale—see design-system |
| Chart | Fixed aspect container; responsive resize; never stretched |
| Table | Sort/filter when JS enabled; sticky header; totals; conditional formatting; scroll on small screens |
| Insight / recommendation | Bullets with icon; scannable; tied to data |

Full KPI catalog, chart types, and table behaviors:
[components.md](references/components.md).

Visual tokens, typography, themes:
[design-system.md](references/design-system.md).

---

## Layout rules

| Viewport | Grid |
|----------|------|
| Desktop | 12 columns |
| Tablet | 6 columns |
| Mobile | 1 column |

Cards wrap automatically; charts resize; tables scroll horizontally when needed. Consistent
whitespace—avoid overcrowding.

---

## Customization

Support via CSS variables and config (no architecture rewrite):

Theme, logo, brand colors, typography, dark/light mode, sidebar, widget visibility, chart types,
metric order, section toggles, card span, number formatting, locale, currency, language.

---

## Performance

Structure for scale: many KPIs, dozens of charts, large tables (virtualize or paginate table rows
in JS when >100 rows). Lazy-init charts (Intersection Observer). Avoid layout thrashing on resize.

---

## Code quality

- Modular HTML sections with stable `id`/`data-*` hooks
- Reusable CSS (variables + BEM-like or `dashboard-*` prefixes)
- Chart logic isolated in adapter module
- Minimal duplication; one layout system

---

## Success criteria

- **CEO:** overall organizational health in ~10 seconds
- **CFO:** financial performance and ROI immediately visible
- **CIO:** operational risks, delivery, and technology health at a glance
- Feels as trustworthy as enterprise BI: rapid comprehension, actionable insights, responsive, accessible

---

## Validation checklist

- [ ] Five executive questions answerable from above-the-fold + summary
- [ ] Executive Summary present and non-empty
- [ ] Heading hierarchy (`h1` → `h2` → `h3`) logical for screen readers
- [ ] Status uses color **and** text/icon
- [ ] Charts in aspect-ratio containers; no distortion
- [ ] Light and dark theme variables defined (even if only one theme active)
- [ ] Mobile layout verified (single column, readable metrics)
- [ ] Keyboard-focusable interactive controls; `aria-label` on icon-only buttons

---

## Additional resources

- [layout-and-hierarchy.md](references/layout-and-hierarchy.md) — wireframe, grid, story flow
- [components.md](references/components.md) — KPIs, charts, tables, smart sections
- [design-system.md](references/design-system.md) — color, type, formatting
- [chart-library-adapter.md](references/chart-library-adapter.md) — swappable chart engine
- [base-dashboard-scaffold.html](references/base-dashboard-scaffold.html) — starter HTML/CSS
