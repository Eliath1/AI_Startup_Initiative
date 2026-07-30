# Implementation Guide

## Stack selection

Choose based on project language and layout complexity:

| Approach | Strengths | Pagination notes |
|----------|-----------|------------------|
| **Python + ReportLab Platypus** | Mature PDF, corporate deployments | Use `KeepTogether`, `CondPageBreak`, custom `Flowable.wrap()` for measurement; two-pass layout for height estimates |
| **Typst** | Excellent typography, native page breaking | Compile `.typ` from template + JSON data; good for report templates |
| **HTML + CSS + WeasyPrint / Playwright PDF** | Familiar styling, dashboards | CSS `break-inside: avoid`, `orphans`/`widows`; measure in headless browser for critical decks |
| **Node + pdfkit / @react-pdf/renderer** | JS ecosystems | React-PDF fits component model; manual break logic |

Default recommendation for **new Python utilities**: ReportLab with modular flowables + a thin
**Pagination Engine** that builds the story list after a measurement pass.

## Two-pass layout pattern

1. **Measure pass:** Render blocks to temporary frame or offscreen context; record heights.
2. **Flow pass:** Insert `PageBreak` / spacing adjustments per [layout-intelligence.md](layout-intelligence.md).
3. **Render pass:** Build final PDF.

For HTML pipelines, equivalent: render hidden container, read `offsetHeight`, then apply breaks.

## Module boundaries

| Module | Responsibility |
|--------|----------------|
| Layout Engine | Frames, margins, printable area |
| Typography Engine | Styles, font registration, line wrapping |
| Pagination Engine | Break decisions, keep-together chains |
| Content Flow Optimizer | Section ordering, density mode |
| White Space Optimizer | Post-pass balance (optional) |
| Page Optimizer | Header/footer reservation, page templates |
| Table Renderer | Row split, header repeat |
| Chart Renderer | Vector export, sizing box |
| Image Renderer | Scale, captions |
| Header/Footer Renderer | Canvas callbacks or static frames |
| Analytics Components | KPI/scorecard flowables |
| Theme Engine | Load preset + config merge |
| Style Manager | Named styles for all renderers |

## Document input schema (minimal)

```json
{
  "meta": { "title": "", "version": "", "date": "" },
  "blocks": [
    { "type": "executive_summary", "priority": 1, "markdown": "..." },
    { "type": "kpi_row", "priority": 2, "items": [] },
    { "type": "section", "priority": 3, "title": "", "markdown": "..." },
    { "type": "table", "priority": 3, "headers": [], "rows": [] },
    { "type": "chart", "priority": 3, "chart_type": "bar", "spec": {} }
  ]
}
```

Convert markdown reports from other skills into `blocks` before layout.

## Charts (implementation)

- **matplotlib:** `savefig(format='svg')` or PDF backend; embed in ReportLab `svg2rlg`
- **Plotly:** export SVG/PNG at 2× only if vector unavailable
- **KPI cards:** native flowables (rect + text), not rasterized

## Quality gates in CI

- Golden-file PDF page count bounds for sample fixtures
- Assert no block bbox exceeds printable area (PDF parsing lib)
- Visual regression optional (pixel diff threshold)

## Security

- Sanitize user HTML/markdown before HTML-based render
- Do not embed remote images without allowlist
- Redact secrets in metadata and debug layout logs
