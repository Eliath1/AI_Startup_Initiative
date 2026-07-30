---
name: pdf-generation
version: 1.0
description: >
  Builds production-ready, executive-quality PDF reports with intelligent pagination, professional
  typography, tables, charts, KPI dashboards, and themeable branding. Use when generating PDFs,
  board decks, audit reports, compliance packages, stakeholder presentations, executive dashboards,
  or converting markdown/report content into print-ready documents. Prioritizes readability and
  layout intelligence over cramming content onto pages.
---

# PDF Generation Engine

### Configuration
```yaml
organization_name: "{{ORGANIZATION_NAME}}"
document_title: "{{DOCUMENT_TITLE}}"
document_version: "{{DOCUMENT_VERSION}}"          # e.g. "1.2"
confidentiality: "{{CONFIDENTIALITY}}"            # e.g. "Confidential — Internal Use Only"
page_size: "{{PAGE_SIZE}}"                        # A4 | Letter
orientation: "{{ORIENTATION}}"                    # portrait | landscape
margin_top_in: 1.0
margin_bottom_in: 1.0
margin_left_in: 1.0
margin_right_in: 1.0
theme_preset: "{{THEME_PRESET}}"                  # e.g. corporate-light, corporate-dark
primary_color: "{{PRIMARY_COLOR}}"
secondary_color: "{{SECONDARY_COLOR}}"
accent_color: "{{ACCENT_COLOR}}"
logo_path: "{{LOGO_PATH}}"                        # optional
cover_page: true
watermark: "{{WATERMARK}}"                        # optional
show_page_numbers: true
header_fields: ["organization_name", "document_version"]
footer_fields: ["page_number", "date", "confidentiality"]
default_font: "Arial"                             # fallback chain: Helvetica, sans-serif
body_font_size_pt: 12
min_body_font_size_pt: 11                         # never go below unless user explicitly requests
```

---

## Purpose

Generate aesthetically pleasing, highly readable, professional PDF documents while automatically
optimizing page layout to maximize space usage **without sacrificing readability**. The engine
intelligently distributes content across pages instead of rendering content sequentially.

Handoff: skills such as `ai-weekly-executive-reports` produce markdown/text; this skill turns
that content (or structured JSON) into a shareable, print-ready PDF.

---

## Core Principles

The PDF generator must prioritize the following, **in this exact order**:

1. Readability
2. Professional appearance
3. Efficient use of space
4. Consistent formatting
5. Customization
6. Extensibility

**Never sacrifice readability simply to fit more information onto a page.**

---

## Definition of Success

A successful implementation should produce documents that a CEO, Board of Directors, investor,
regulator, or client can read comfortably without noticing layout issues. Every page should appear
intentionally designed, with balanced spacing, clear hierarchy, and efficient use of space. The
engine should make intelligent pagination and layout decisions automatically, minimizing manual
adjustments while preserving a polished, publication-quality appearance.

---

## Workflow

Copy and track progress:

```
Task Progress:
- [ ] 1. Ingest content (markdown, JSON schema, or API payload)
- [ ] 2. Resolve theme + page setup from config (no engine code changes)
- [ ] 3. Build document model (sections, blocks, metadata, render priority)
- [ ] 4. Estimate block heights; run pagination / content-flow optimizers
- [ ] 5. Render elements (typography → tables → charts → images → headers/footers)
- [ ] 6. Validate printable area, min font sizes, and layout quality checklist
- [ ] 7. Deliver PDF + brief layout notes (page count, any deferred splits)
```

### Step 1: Content model

Normalize input into an ordered list of **blocks** with types and priority:

| Type | Render priority (high → low) |
|------|------------------------------|
| Titles, cover, executive summary | Highest |
| Charts, KPI cards, scorecards | High |
| Tables, comparison blocks | High |
| Insights boxes, recommendations | Medium-high |
| Body text, narrative sections | Medium |
| Appendices, footnotes | Lower |

Each block carries: `id`, `type`, `title`, `content`, `estimated_height_pt` (computed after first
measure pass if unknown), `keep_with_next`, `keep_together` (for heading + first paragraph).

### Step 2: Theme and page setup

Apply margins, page size, fonts, and colors from config only — see
[references/theme-system.md](references/theme-system.md). Printable area = page minus margins;
**no content may overflow** the printable region.

### Step 3: Layout intelligence (required)

Before every page break, evaluate:

- Remaining page height
- Estimated height of the next section (paragraph, table, chart, image)
- Orphan/widow rules and heading isolation

**Content flow rule:**

```
IF remaining_space >= estimated_section_height (+ safety margin)
THEN keep section on current page
ELSE move section to next page (or apply adaptive compression — see below)
```

Do not blindly insert page breaks.

Full rules: [references/layout-intelligence.md](references/layout-intelligence.md).

### Step 4: Adaptive compression (limited)

If content slightly exceeds the page limit, **before** breaking the page:

1. Reduce section spacing slightly
2. Reduce paragraph spacing slightly
3. Reduce chart/table internal padding slightly

**Never** reduce font below readability thresholds. **Never** compress excessively. **Never**
reduce font size solely to fit additional content on a page.

### Step 5: Render and validate

Run the [Output quality checklist](#output-quality-checklist) before delivery.

---

## Typography (summary)

Default font: **Arial**; fallbacks: **Helvetica**, **sans-serif**.

| Element | Size (pt) |
|---------|-----------|
| Document title | 20–24 |
| Section titles | 16–18 |
| Subtitles | 14–16 |
| Body text | 12 |
| Table content | 11–12 |
| Footnotes | 10 |
| Header/footer | 8–10 |

Never use body text smaller than **11 pt** unless the user explicitly requests it.

Details: [references/page-and-typography.md](references/page-and-typography.md).

---

## Components (summary)

Implement via modular renderers — do not monolithically embed layout logic in one script.

| Component | Requirements |
|-----------|----------------|
| Tables | Alternating rows, header highlight, wrap, auto columns, multi-page + repeated headers, numeric alignment, totals/summary rows, optional rounded borders |
| Charts | Bar, line, pie, area, scatter, stacked bar, heat map; KPI cards & trend indicators; vector/SVG preferred; fixed aspect ratio; no margin overflow |
| Analytics | KPIs, metrics, growth %, status, progress bars, risk indicators, comparison tables, scorecards, executive summary, insights, recommendations |
| Images | PNG, JPEG, SVG, icons, logos; proportional scale; captions |
| Headers/footers | Page #, date, org name, version, logo, confidentiality; subtle styling |

Details: [references/components.md](references/components.md).

---

## Modular architecture

Separate concerns — suggested modules:

- Layout Engine
- Typography Engine
- Pagination Engine
- Chart Renderer
- Table Renderer
- Theme Engine
- Style Manager
- Image Renderer
- Header/Footer Renderer
- Analytics Components
- Page Optimizer
- Content Flow Optimizer
- White Space Optimizer

Implementation patterns and library options:
[references/implementation-guide.md](references/implementation-guide.md).

---

## Dynamic spacing

Spacing must **adapt** to content density — not fixed everywhere.

- **Large reports:** slightly tighter section spacing (within readability bounds)
- **Short reports:** slightly more whitespace for elegance

Keep related elements together; balance page density; avoid pages with only a few lines or large
empty regions.

---

## Professional appearance target

Generated reports should resemble polished output from top-tier consulting firms, Fortune 500
executive reporting, and modern word processors — **modern, restrained, suitable for executive
audiences**. Avoid compressed or “dashboard dumped to PDF” aesthetics.

---

## Output quality checklist

The generated PDF must always:

- [ ] Be visually balanced across pages
- [ ] Maximize page usage without cramming
- [ ] Preserve readability (fonts ≥ configured minimum)
- [ ] Avoid unnecessary blank space and orphan headings
- [ ] Keep consistent margins; nothing outside printable area
- [ ] Use intelligent pagination (no heading alone at page bottom)
- [ ] Render professional tables (headers repeat on multi-page tables)
- [ ] Render sharp charts (vector where possible)
- [ ] Apply theme consistently (colors, type hierarchy)
- [ ] Be print-ready (embedded fonts if required by viewer)

---

## Customization boundary

End users customize via **config and theme presets** (colors, fonts, margins, headers, footers,
logo, numbering, section/table/chart themes, cover, watermark, orientation, paper size) —
**without modifying the rendering engine source**.

---

## Additional resources

- [references/page-and-typography.md](references/page-and-typography.md) — A4/Letter, margins, type scale
- [references/layout-intelligence.md](references/layout-intelligence.md) — pagination, orphans, white space
- [references/components.md](references/components.md) — tables, charts, dashboards, media
- [references/theme-system.md](references/theme-system.md) — branding and presets
- [references/implementation-guide.md](references/implementation-guide.md) — stack choice, measurement, modules
