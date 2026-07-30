# Design System

## Visual tone

Professional, modern, minimal, executive, elegant. Subtle shadows only. Soft elevation.

## Color roles (CSS variables)

Define for **light** and **dark** themes:

| Token | Usage |
|-------|--------|
| `--color-primary` | Brand, key actions |
| `--color-secondary` | Secondary chrome |
| `--color-accent` | Highlights, links |
| `--color-success` | On-track, positive variance |
| `--color-warning` | Monitor, moderate risk |
| `--color-danger` | Critical, negative variance |
| `--color-neutral-*` | Backgrounds, borders, muted text |

Pair every semantic color with **label + icon** (e.g. "At risk", not red alone).

## Typography

Font stack (first available): **Inter**, Segoe UI, Roboto, Arial, sans-serif.

| Role | Size |
|------|------|
| Dashboard title | 28–36px |
| Section title | 20–24px |
| Card title | 16–18px |
| Metric value | 28–40px |
| Body | 14–16px |
| Caption | 12–13px |

## Spacing

Use a 4px or 8px scale. Section gap: 24–32px. Card padding: 16–24px. Grid gutter: 16–24px.

## Financial and numeric formatting

Support:

- Currency: `$15.2M`, `€8.4B`, `MXN $450,000`
- Percentages: `ROI 165%`, `IRR 23%`
- Signed savings: `Savings +$1.4M`
- Negatives and accounting notation: `(1.2M)` when locale requires
- Compact millions/billions with configurable decimals
- `Intl.NumberFormat` for locale when rendering in JS

## Accessibility

- WCAG contrast for text and status chips
- Visible focus rings on interactive elements
- `aria-live="polite"` for dynamic KPI refresh regions (if live data)
- Meaningful `alt` / `aria-hidden` on decorative sparklines
- Proper heading order; landmark regions labeled

## Theme toggle

Implement via `data-theme="light|dark"` on `html` or `:root` class swap—all components consume
variables only (no hard-coded hex in component rules except variable definitions).
