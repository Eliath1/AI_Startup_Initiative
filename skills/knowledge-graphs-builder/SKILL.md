---
name: knowledge-graphs-builder
version: 1.0
description: >
  Ingests unstructured organizational data (documents, tickets, meeting notes, decision logs)
  and builds a queryable entity-relationship graph connecting initiatives, owners, risks,
  decisions, and compliance obligations. Use for building a knowledge graph, mapping
  relationships between projects/people/risks, or when other skills need structured context
  instead of re-reading long documents every session. Infrastructure skill — supports the
  other skills in this suite rather than producing a customer-facing deliverable on its own.
---

# Knowledge Graphs Builder

### Configuration
```yaml
organization_name: "{{ORGANIZATION_NAME}}"
storage_backend: "{{STORAGE_BACKEND}}"    # e.g. "in-memory for session", "artifact storage", "external graph DB"
```

---

## Purpose

The other skills in this suite (especially `ai-program-manager`) work well on a handful of
initiatives but degrade as a portfolio grows — re-reading every ticket, document, and decision
log each session gets expensive and error-prone. This skill builds a structured graph once,
then lets other skills *query relationships* instead of *re-parsing documents*. That's both a
capability improvement (better reasoning over connections) and a token-efficiency measure
(structured lookups are far cheaper than repeated full-document re-reads).

This is infrastructure — it's what makes the other skills scale, not a report a customer reads directly.

---

## Entity Schema

| Entity Type | Key Attributes | Example |
|---|---|---|
| **Initiative** | name, platform, status, owner, budget, strategic_priority_link | "Customer Support AI Assistant" |
| **Person** | name, role, decision_rights (per `ai-program-manager` Part X) | "AI Strategy Lead" |
| **Risk** | id (R-###), severity, status, velocity, owner | "R-014: vendor data residency gap" |
| **Decision** | id (D-###), date, made_by, rationale, linked_initiative | "D-022: approved Stage 2 for Finance AI" |
| **Compliance Obligation** | framework (GDPR/EU AI Act/etc.), applies_to, status | "EU AI Act high-risk classification — HR screening tool" |
| **Document** | type, date, source_system, linked_entities | "2026-03-24 Weekly Status Report" |

## Relationship Types

```
Initiative --owned_by--> Person
Initiative --has_risk--> Risk
Initiative --subject_to--> Compliance Obligation
Initiative --produced--> Decision
Decision --made_by--> Person
Risk --escalated_to--> Person
Document --references--> Initiative | Risk | Decision
Person --has_decision_right_over--> Initiative (per RACI/decision-rights model)
```

---

## Build Process

1. **Ingest** — pull source documents/tickets/notes (from connected tools, or provided directly)
2. **Extract entities** — identify Initiatives, People, Risks, Decisions, Compliance Obligations
   mentioned; deduplicate against existing graph (same initiative referenced across multiple
   documents should resolve to one node, not multiples)
3. **Extract relationships** — determine how extracted entities connect, per the relationship
   types above
4. **Validate** — flag ambiguous extractions for human confirmation rather than guessing silently
   (e.g., two similarly-named initiatives — confirm before merging or keeping separate)
5. **Store** — per configured `storage_backend`. For a single working session, an in-memory
   structure is sufficient; for persistence across sessions, use the artifact storage pattern
   (key-value store) so the graph survives between conversations
6. **Expose for query** — other skills (or direct questions) query the graph rather than
   re-reading source documents: "which initiatives does [person] have decision rights over?"
   "which risks are linked to [initiative] and what's their current severity?"

## Query Patterns (examples)

- "Show me all initiatives with an unresolved Critical risk"
- "Which decisions were made about [initiative] in the last quarter, and by whom?"
- "What compliance obligations apply to [initiative], and are they all satisfied?"
- "Which initiatives has [person] made decisions on, and were those decisions consistent?"

## When NOT to Use This
For a small portfolio (roughly under 10 active initiatives), the overhead of building and
maintaining a graph likely exceeds the benefit — `ai-program-manager` reading source documents
directly is simpler and sufficient. This skill earns its complexity once a portfolio is large
enough that re-reading everything each session is genuinely slow or error-prone.

Full schema definitions and extraction prompting patterns: `references/graph-schema.md`
