# Layout Intelligence

## Problem to avoid

Unacceptable pattern: many short sections each on their own page with large blank regions, e.g.
Topic A (3 lines) → huge gap → page break → Topic B alone → etc.

**Goal:** Reorganize flow so multiple sections share a page when they **comfortably fit** and
remain readable.

## Pre-break evaluation

Before creating a page break, compute:

1. `remaining_height` — space left on current page (after header/footer reservation)
2. `next_block_height` — sum of block + spacing + optional `keep_with_next` chain
3. For tables/charts/images: include full block height or split plan (table continuation)

Inputs: paragraph line count × line height, table row heights, chart fixed aspect box, image
scaled height + caption.

## Content flow algorithm

For each block `B` in priority order:

```
estimate = measure(B) + spacing_after(B)

if B.keep_together and estimate > remaining_height:
    if adaptive_compression_can_fit(B, remaining_height):
        apply_mild_compression(B)
    else:
        page_break()
        place(B)
else if heading(B) and content(B) would orphan:
    page_break()  # keep heading with at least first line/paragraph of body
else if estimate <= remaining_height:
    place(B)
else:
    page_break()
    place(B)

update remaining_height
```

`safety_margin`: reserve ~6–12 pt below footer zone to avoid clipping.

## Orphans, widows, headings

| Rule | Action |
|------|--------|
| Widow | Avoid single line of paragraph at top of new page — pull back or tighten prior page spacing slightly |
| Orphan | Avoid single line at bottom of page — same |
| Heading isolation | Never leave a section heading as the last element on a page; require ≥2 lines of following content or move heading down |
| `keep_together` | Small insight boxes, KPI rows, chart + title |
| `keep_with_next` | Heading + first paragraph; table title + header row |

## Multi-page tables

- Repeat header row on each continuation page.
- Avoid splitting a row across pages; split between rows.
- Summary/total rows: prefer `keep_together` with last data rows or own page if large.

## White space optimization

- Minimize **excessive** vertical gaps; do not minimize readability.
- If two sections fit with standard spacing, keep together.
- If a page would end with &lt;15% printable height used after a break, reconsider break (merge
  prior spacing compression or pull next small block up).
- Avoid “almost empty” last pages unless appendices intentionally sparse.

## Adaptive compression (order)

Apply only when overflow is **small** (typically &lt;5% of page height):

1. Section `space_before` / `space_after` (−10% to −20%, floor at min tokens)
2. Paragraph `space_after` (−10% to −15%)
3. Chart/table cell padding (−10%)
4. **Do not** change font sizes in this pass

If still overflow → page break, not further compression.

## Page balancing (optional pass)

For long documents, a second pass may move a small trailing block from page N+1 to page N if
`remaining_height` on N fits after mild compression and no orphan rules violated.

## Density modes

| Mode | When | Spacing |
|------|------|---------|
| `compact` | Many sections, long report | Slightly reduced section gaps |
| `balanced` | Default | Theme defaults |
| `airy` | Short memo, cover letter | Slightly increased section gaps |

Select from total page count or user config; never mix modes arbitrarily within one document.
