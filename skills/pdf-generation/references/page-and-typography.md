# Page and Typography Standards

## Page sizes

Support **A4** and **Letter**; `page_size` in config selects the active format. Orientation
(portrait/landscape) is configurable.

## Margins (defaults)

Microsoft Word–like defaults (all configurable):

| Edge | Default |
|------|---------|
| Top | 1 inch (2.54 cm) |
| Bottom | 1 inch |
| Left | 1 inch |
| Right | 1 inch |

All layout math uses the **printable area** only: page dimensions minus margins. Clip or reflow
any element that would extend past this box — never draw into the margin gutter except deliberate
full-bleed cover art when explicitly enabled.

## Font stack

1. **Arial** (default)
2. **Helvetica**
3. Generic **sans-serif**

Embed or subset fonts when producing PDFs for environments where Arial may not resolve.

## Type scale (recommended)

| Role | Size (pt) | Notes |
|------|-----------|--------|
| Document title | 20–24 | Cover or first page |
| Section titles | 16–18 | One clear level per heading style |
| Subtitles | 14–16 | |
| Body | 12 | Primary narrative |
| Table body | 11–12 | Never below 11 unless user override |
| Footnotes | 10 | |
| Header/footer | 8–10 | Muted color vs body |

## Readability rules

- Line length: target ~60–75 characters for body where possible (adjust column width, not font size).
- Line height: ~1.35–1.5× font size for body; tighter only for tables if still readable.
- Contrast: body text on white/light background ≥ WCAG AA where feasible.
- **Never** shrink body text to fit more on a page.
- Hierarchy via size, weight, and spacing — not color alone.

## Heading styles

Map config theme to named styles: `Title`, `Heading1`, `Heading2`, `Subtitle`, `Body`,
`TableHeader`, `TableCell`, `Caption`, `Footnote`, `HeaderFooter`.

Consistent style names allow customization without touching layout code.
