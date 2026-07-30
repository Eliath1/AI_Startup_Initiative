# Layout and Information Hierarchy

## Default wireframe (ASCII)

```
┌────────────────────────────────────────────────────────────────────────────┐
│ Company Logo                           Executive Performance Dashboard     │
│ Q2 FY2026                                                     Last Update  │
├────────────────────────────────────────────────────────────────────────────┤
│ 🟢 Executive Summary                                                 AI     │
│ Revenue exceeded target by 8%, ROI increased to 167%, two risks detected. │
└────────────────────────────────────────────────────────────────────────────┘

┌──────────────┬──────────────┬──────────────┬──────────────┬───────────────┐
│ Revenue      │ ROI          │ EBITDA       │ Savings      │ Health Score  │
│ $24.8M ▲12%  │ 167% ▲18%    │ $8.4M ▲7%    │ $2.1M ▲22%   │ 92/100 🟢     │
│ ▁▂▃▄▅▆▇█     │ ▁▂▃▄▅▆▇█      │ ▁▂▂▃▄▅▆█     │ ▁▃▄▅▆▇██     │ ▁▂▃▄▅▆▇█      │
└──────────────┴──────────────┴──────────────┴──────────────┴───────────────┘

┌──────────────────────────────┬────────────────────────────────────────────┐
│ Revenue Trend (12 Months)    │ ROI vs Target                              │
│      Line Chart              │             Bar Chart                      │
└──────────────────────────────┴────────────────────────────────────────────┘

┌──────────────────────────────┬────────────────────────────────────────────┐
│ Value Realization            │ Budget vs Actual                           │
│      Donut Chart             │          Stacked Bars                      │
└──────────────────────────────┴────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────┐
│ Executive Insights                                                   AI    │
│ • Revenue growth driven by Enterprise segment (+14%)                      │
│ • Cloud migration generated $1.2M in realized savings                     │
└────────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────┬────────────────────────────────────────────┐
│ Top Risks                    │ Top Opportunities                          │
└──────────────────────────────┴────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────────────────────────┐
│ Detailed Performance Table (sticky header, conditional status)             │
└────────────────────────────────────────────────────────────────────────────┘
```

Same principle as leading BI platforms: **summary → KPIs → trends → insights → evidence**.

## Grid placement (12-column desktop)

| Section | Typical span |
|---------|----------------|
| Executive Summary | 12 |
| KPI card | 2–3 each (5 KPIs ≈ 2+2+2+2+4 or equal thirds) |
| Chart pair | 6 + 6 |
| Risks / Opportunities | 6 + 6 |
| Full-width table | 12 |

Tablet: treat spans as max 6 (two KPIs per row). Mobile: all span 12.

## Data storytelling block order

Within `main`, optional narrative strip after summary:

1. What happened (facts + KPI deltas)
2. Why it happened (drivers, segments)
3. Business impact (value, risk exposure)
4. Recommendations (prioritized)
5. Next actions (owners, dates when known)

## Above-the-fold target

Minimum visible without scroll on 1080p: header, executive summary, primary KPI row, and at least
one trend chart or alert strip.
