# Chart Library Adapter

Goal: **swap Chart.js, ECharts, Highcharts, or D3** without changing dashboard HTML architecture.

## Contract

Each chart mount point:

```html
<div class="chart-card" data-chart-id="revenue-trend" data-chart-type="line"
     data-chart-config='{"series":[...]}' role="img" aria-label="Revenue trend 12 months">
  <div class="chart-card__header">...</div>
  <div class="chart-card__body">
    <canvas class="chart-mount" data-chart-engine="chartjs"></canvas>
  </div>
  <p class="chart-card__caption">...</p>
</div>
```

- **Layout/CSS** targets `.chart-card`, never library-specific classes in grid rules.
- **Config** lives in JSON (`data-chart-config` or inline script `window.DASHBOARD_CHARTS`).
- **Engine** selected once: `data-chart-engine` on mount or global `CHART_LIBRARY` constant.

## Adapter interface (JavaScript)

Implement one module per engine with the same exports:

```javascript
// dashboard-charts/index.js
export function initAllCharts(mountSelector = '.chart-mount') { ... }
export function destroyAllCharts() { ... }
export function renderChart(mountEl, type, config) { ... }
```

`renderChart` maps abstract `type` + `config` to library-specific API:

| Abstract type | Config keys (minimal) |
|---------------|------------------------|
| line | categories, series[], yFormat |
| bar | categories, series[] |
| donut | labels, values |
| stackedBar | categories, series[] |
| gauge | value, min, max, targets |

## Default recommendation

- **Chart.js** for simple KPI dashboards (fast, lightweight)
- **ECharts** for mixed types, heatmaps, treemaps, large series
- **D3** when custom layout is required—still use `.chart-mount` container

## React note

If output is React, **Recharts** components mirror the same props as `config` JSON; keep section
layout in a parent `DashboardGrid` unchanged.

## No-JS fallback

Provide `<table class="chart-fallback">` or summary stats inside `data-chart-config` for accessibility
and static HTML delivery; hide fallback when JS initializes.
