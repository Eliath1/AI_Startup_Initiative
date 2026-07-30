# Theme System

## Design goal

End users change appearance via **config + preset files**, not by editing pagination or render
modules.

## Theme file shape (example)

```yaml
name: corporate-light
fonts:
  family: Arial
  fallbacks: [Helvetica, sans-serif]
colors:
  primary: "#003366"
  secondary: "#5A6978"
  accent: "#0078D4"
  text: "#1A1A1A"
  text_muted: "#666666"
  background: "#FFFFFF"
  table_header_bg: "#E8EEF4"
  table_row_alt: "#F7F9FB"
  insight_bg: "#F0F6FF"
  risk_high: "#C50F1F"
  risk_medium: "#FFB900"
  risk_low: "#107C10"
spacing:
  section_before_pt: 18
  section_after_pt: 12
  paragraph_after_pt: 8
  table_cell_padding_pt: 6
typography:
  title_pt: 22
  heading1_pt: 17
  heading2_pt: 15
  body_pt: 12
  table_pt: 11
  footnote_pt: 10
tables:
  border_color: "#D0D7DE"
  rounded_corners: false
charts:
  palette: [primary, accent, secondary, "#888888"]
headers:
  height_pt: 36
  show_logo: true
footers:
  height_pt: 28
  show_page_numbers: true
```

## Presets

Ship at least: `corporate-light`, `corporate-dark` (light text on dark background with adjusted
table/chart colors). Allow org overrides for `primary_color`, `secondary_color`, `accent_color`.

## Dark themes

- Body background dark → invert text/table fills accordingly
- Charts use lighter gridlines and label colors
- Do not reuse light-theme table alternation without adjustment

## Customization surface (no engine edits)

Users may override via config:

- Colors, fonts, margins
- Header/footer fields and logo
- Page numbering style
- Section/table/chart theme names
- Cover page on/off, watermark text
- Orientation and paper size

Engine reads merged theme: `preset` + config overrides.

## Style Manager responsibilities

- Resolve final pt sizes and colors per element type
- Enforce `min_body_font_size_pt` from global config
- Expose named styles to all render modules consistently
