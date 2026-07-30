# Enterprise Projects — Sample Workflow

End-to-end reference for **C-suite executive brief**, **PDF**, and **interactive dashboard**
using the skills in this repository.

## Inputs (`inputs/`)

| File | Role |
|------|------|
| `Jira_CRM_Raw_Project_Database.md` | Jira export, worklogs, AI audit notes |
| `Enterprise_Projects_Transactional_Database.xlsx` | CapEx ledger, CRM unit sales, AI value logs |

## Outputs (`outputs/`)

| File | Produced by |
|------|-------------|
| `Enterprise_Projects_Executive_Analysis.md` | C-suite brief (`c-suite-executive-brief.md` template) |
| `Enterprise_Projects_Executive_Analysis.pdf` | `scripts/render-executive-brief-pdf.ps1` |
| `Enterprise_Projects_Executive_Brief.html` | Same script (print intermediate) |
| `Enterprise_Projects_Executive_Dashboard.html` | `executive-dashboard-rendering` skill |

## Regenerate PDF

From repo root (requires Google Chrome):

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\render-executive-brief-pdf.ps1
```

Optional paths:

```powershell
.\scripts\render-executive-brief-pdf.ps1 -MarkdownPath .\samples\enterprise-projects\outputs\Enterprise_Projects_Executive_Analysis.md
```

## Skills involved

- `skills/ai-program-manager/references/c-suite-executive-brief.md`
- `skills/ai-program-manager/references/executive-brief-pdf.css`
- `skills/executive-dashboard-rendering/`
- `.cursor/rules/ai-weekly-executive-reports.mdc`
