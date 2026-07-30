# Dashboard Components

## KPI cards

Each card includes:

- Title
- Current value
- Previous value (or prior period label)
- Difference (absolute and/or %)
- Trend arrow (↑ ↓ →)
- Small sparkline (inline SVG or canvas)
- Status indicator (text + color)
- Short explanation (one line)

### Supported metric names (non-exhaustive)

Revenue, Profit, EBITDA, ROI, ROIC, NPV, Value Realization, Cost Savings, Budget Consumption,
Cash Flow, Forecast Accuracy, Velocity, Lead Time, Cycle Time, Customer Satisfaction, NPS, Risk
Score, Technical Debt, Bug Count, Incidents, Availability, Utilization, Efficiency, Adoption,
Completion %, Health Score—and executive metrics: Expenses, Margin, Growth, Profitability, CAPEX,
OPEX, Value Delivered, Business Value, Customer Value, Time Savings, Automation Impact, Risk
Reduction, Quality, Burn Rate, Security, Satisfaction.

## Charts

Supported types: line, bar, horizontal bar, pie, donut, area, stacked bar, waterfall, heat map,
treemap, scatter, bubble, radar, gauge, timeline, forecast, variance, burn down, burn up,
milestone, KPI trend, benchmark comparison.

Rules:

- Wrapper: `aspect-ratio` or fixed min-height + `width: 100%`
- Resize with `ResizeObserver` when using canvas/WebGL libraries
- Title + optional subtitle; source/period in caption
- No stretched SVG/canvas—preserve aspect ratio

## Tables

When JavaScript is included, prefer:

- Sortable columns (click header)
- Filter row or search
- Grouping (optional)
- Sticky header
- Totals / subtotals rows
- Conditional formatting (variance, status)
- Icons and inline progress bars
- Expandable detail rows
- Pagination for large datasets

Mobile: horizontal scroll container with `overflow-x: auto` and sticky first column optional.

## Smart analytics sections

Auto-generate when input data supports:

| Section | Content |
|---------|---------|
| Top Opportunities | Ranked bullets, impact hint |
| Critical Risks | Severity, owner if known |
| Anomalies | Metric, deviation, period |
| Forecast | Point forecast + confidence note |
| Executive Insights | Narrative bullets |
| AI Recommendations | Action-oriented, prioritized |
| Trend Analysis | Direction + driver |
| Variance Analysis | Plan vs actual |
| Value Drivers | Contributors to ROI/value |
| Root Cause Analysis | Structured cause chain |
| Business Impact | Quantified where possible |
| Priority Matrix | 2×2 or ranked list |

## Executive Summary card

Required. Structure:

- Status chip (overall health)
- 2–5 sentences: headline outcome, financial highlight, risk count, recommendation count
- Optional "AI" badge when insights are model-generated—label clearly

## Alerts strip

Place below summary when any critical threshold breached: icon, metric, threshold, link/anchor to
detail section.
