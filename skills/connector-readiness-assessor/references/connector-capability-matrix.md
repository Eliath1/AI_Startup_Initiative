# Connector Capability Matrix

*Loaded when running an actual customer connector assessment. Review for currency each use —
this ecosystem moves fast.*

---

## Matrix

| Tool | Category | Typical Access Needed | Least-Privilege Scope | Notes |
|---|---|---|---|---|
| **Jira** (Atlassian) | PM/Ticketing | Read/write | Project-scoped, not org-wide admin | Core dependency for `ai-program-manager` |
| **Confluence** (Atlassian) | Docs | Read/write | Space-scoped | Pairs with Jira for governance documentation |
| **Notion** | Docs/PM | Read/write | Page/database-scoped, not full workspace | Common alternative to Jira+Confluence for smaller orgs |
| **Slack** | Chat/Comms | Read (channel-scoped), post capability if notifications desired | Specific channels, not full workspace history | Useful for context and pushing report notifications |
| **Microsoft Teams** | Chat/Comms | Same as Slack | Team/channel-scoped | Common in Microsoft-native orgs |
| **Outlook / Microsoft 365** | Email/Calendar | Read for context, rarely write | Calendar read for cadence scheduling | Usually lower priority unless email-triggered workflows are in scope |
| **Google Workspace** (Docs/Sheets/Calendar) | Docs/PM | Read/write depending on use | Specific drive folders, not full Drive | Common alternative stack to Microsoft |
| **GitHub** | Dev | Read (issues/PRs), write only if ticket-linking automation desired | Repo-scoped, not org-admin | Relevant mainly for engineering-heavy portfolios |
| **GitLab / Bitbucket** | Dev | Same as GitHub | Project-scoped | Alternatives to GitHub |
| **Asana** | PM/Ticketing | Read/write | Project/team-scoped | Alternative to Jira |
| **Linear** | PM/Ticketing | Read/write | Team-scoped | Common in smaller/eng-heavy orgs |
| **ChatGPT Enterprise / Copilot** | Existing AI tooling | Usage/admin visibility if assessing overlap | Admin console read access | Relevant for maturity assessment (`ai-adoption-strategy-architect`), not this suite's core operation |
| **Cursor** | Dev/AI tooling | N/A — consumption side, not typically a data source for this suite | — | Relevant as a *delivery target* for skills (see root README), not a connector to pull data from |
| **Figma** | Design | Read, rarely needed for this skill suite | File-scoped | Lowest priority unless design-process governance is explicitly in scope |

---

## Connection Steps — General Pattern

Regardless of tool, the setup sequence is consistent:
1. Confirm the customer has admin rights (or access to someone who does) for the target workspace
2. Generate/authorize credentials scoped to the minimum access defined above
3. Test with a read-only query before enabling any write capability
4. Document what was connected, by whom, with what scope — this becomes part of the governance
   record (`ai-program-manager` Part V, Data Integrity Audit, expects this documentation to exist)
5. Set a review date — access should be re-certified periodically (per IAM principles in
   `ai-program-manager`'s compliance reference), not connected once and forgotten

## Red Flags During Setup
- Customer wants to grant org-wide admin access "to make it easier" — push back, define
  actual scope needed instead
- No clear single owner for the connection once it's live — someone needs to be accountable
  for it, matching the RACI model
- Tool doesn't support scoped/read-only access at all — flag as a genuine limitation, document
  the broader access as a documented exception with compensating controls, not silently

## When a Tool Has No Available Connector
Fallback options, in order of preference:
1. **Manual export/import** — customer exports data periodically (CSV, JSON), skill works from
   the export rather than live connection — lower fidelity but zero integration risk
2. **Generic API/webhook** — if the tool has an API but no purpose-built connector exists yet,
   a lightweight custom integration may be justified for high-value, frequently-used tools
3. **Not yet supported** — be honest about this rather than forcing a workaround; log it as a
   roadmap item for the connector matrix maintenance cycle
