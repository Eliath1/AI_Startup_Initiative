# Document Components

## Tables

Professional table requirements:

- Alternating row fill (theme `table_row_alt`)
- Distinct header row (background + semibold)
- Optional rounded corners (outer border only; avoid breaking multi-page splits)
- Cell alignment: left text, right numbers, center status badges
- Auto column width from content with min/max caps
- Wrapped text in cells; fixed header row height
- Multi-page with **repeated headers**
- Conditional formatting via theme rules (e.g. negative variance in accent red)
- Summary rows and totals: visually separated (top border, bold)

Split strategy: break between rows; never mid-row. Totals stay with last data page when possible.

## Charts

Supported types: bar, line, pie, area, scatter, stacked bar, heat map; plus **KPI cards** and
**trend indicators** (arrow + % delta).

Rendering rules:

- Prefer **SVG or PDF vector** paths (matplotlib `svg`, Plotly Kaleido SVG, native chart API)
- Fixed aspect ratio container; scale to max width of printable area
- Minimum readable axis labels — if too small, increase chart height or move to own page
- No upscaling raster assets (avoid pixelation)
- Title + optional subtitle above; source/footnote below in Caption style

## Data analytics / dashboard blocks

Composable blocks for executive PDFs:

| Block | Typical content |
|-------|-----------------|
| KPI card | Label, value, unit, sparkline optional |
| Metric row | 3–4 KPIs in one horizontal band |
| Growth indicator | Value + % change + direction icon |
| Status badge | On-track / at-risk / blocked colors from theme |
| Progress bar | Filled ratio with label |
| Risk indicator | Severity color + short text |
| Comparison table | Period-over-period columns |
| Scorecard | RAG grid |
| Executive summary | Bordered or tinted box, highest priority placement |
| Insights / recommendations | Icon + bullet list; `keep_together` when short |

Place high-priority analytics above dense appendix tables when possible.

## Images

Formats: PNG, JPEG, SVG (preferred for logos/icons).

- Scale proportionally to max width; never stretch
- Respect margins; optional float with text wrap only if engine supports it cleanly
- Captions in Caption style below image
- Logos in header/cover: max height cap (e.g. 0.5 inch) to keep headers subtle

## Headers and footers

Fields (config-driven): page number, date, organization name, document version, logo,
confidentiality notice, custom tokens.

- Visually subtle: HeaderFooter font 8–10 pt, secondary color
- Different first page / cover: often suppress header or use full-bleed cover
- Page numbers: `Page X of Y` or `X` — consistent with theme

## Cover page

When `cover_page: true`: title, subtitle, date, org logo, version, confidentiality. Does not
count toward running header on page 1 body unless configured.

## Watermarks

Diagonal or centered low-opacity text/image behind body; must not impair body readability.
