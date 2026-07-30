# AI Governance & Program Management Skill Suite

A portable, config-driven suite of AI governance, adoption strategy, and program-management
skills — built to drop into Claude or Cursor.

**This repository is for evaluation.** See [`LICENSE.md`](./LICENSE.md) — commercial use
requires a separate agreement with the owner.

---

## What's included

| Skill | What it does |
|---|---|
| `ai-program-manager` | Governs an existing AI initiative portfolio — audits, compliance, executive reporting, intake scoring |
| `ai-adoption-strategy-architect` | For organizations starting from zero — maturity assessment, use-case prioritization, 12-month roadmap |
| `ai-weekly-executive-reports` | Standalone recurring status reporting, source-agnostic |
| `knowledge-graphs-builder` | Structures portfolio data (initiatives, risks, decisions, compliance) into a queryable graph |
| `connector-readiness-assessor` | Assesses and sequences which tool integrations a customer needs |

Each skill's `SKILL.md` has a `Configuration` block at the top — fill in your organization's
specifics there before use. Deeper material lives in each skill's `references/` folder, loaded
only when needed.

---

## Using this in Claude

Copy the relevant `skills/<name>/` folder into your project's `.claude/skills/` directory (or
your local Claude Code skill path), or upload the `SKILL.md` directly through claude.ai's
custom skill flow.

## Using this in Cursor

Cursor reads `.cursor/rules/*.mdc`, already included and pre-generated in this repo — clone it
and the rules are available to the agent automatically.

If you edit a skill's `SKILL.md` and want to regenerate the Cursor adapters:
```bash
node tools/generate-cursor-rules.js
```

---

## Interested in using this commercially, or want the full suite with updates and implementation support?
Contact the repository owner to discuss licensing.
