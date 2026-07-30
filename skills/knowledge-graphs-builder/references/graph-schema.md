# Graph Schema — Full Definitions & Extraction Patterns

*Loaded when actually building or querying a graph, not needed for casual discussion of the concept.*

---

## Full Entity Attribute Definitions

### Initiative
```json
{
  "id": "string (stable, e.g. slugified name)",
  "name": "string",
  "platform": "string (which portfolio platform, per ai-program-manager config)",
  "status": "on_track | at_risk | blocked | completed",
  "owner_id": "reference to Person",
  "budget": "number",
  "budget_currency": "string",
  "strategic_priority_link": "string or null",
  "lifecycle_stage": "string (per governance-lifecycle.md stages)",
  "created_date": "ISO date",
  "last_updated": "ISO date"
}
```

### Person
```json
{
  "id": "string",
  "name": "string",
  "role": "string",
  "decision_rights": ["array of Initiative IDs or 'all'"],
  "raci_roles": ["array — e.g. ['AI Strategy Lead', 'Exec Sponsor']"]
}
```

### Risk
```json
{
  "id": "R-###",
  "description": "string",
  "severity": "Critical | High | Medium | Low",
  "velocity": "increasing | stable | decreasing",
  "status": "open | mitigated | closed",
  "owner_id": "reference to Person",
  "linked_initiative_id": "reference to Initiative",
  "identified_date": "ISO date"
}
```

### Decision
```json
{
  "id": "D-###",
  "description": "string",
  "date": "ISO date",
  "made_by_id": "reference to Person",
  "rationale": "string",
  "linked_initiative_id": "reference to Initiative",
  "immutable": true
}
```

### Compliance Obligation
```json
{
  "id": "string",
  "framework": "string (e.g. 'EU AI Act', 'GDPR', 'ISO 27001')",
  "requirement": "string",
  "applies_to_initiative_id": "reference to Initiative",
  "status": "not_started | in_progress | satisfied | non_compliant",
  "evidence_link": "string or null"
}
```

---

## Extraction Prompting Pattern

When processing a source document to extract entities/relationships, use a structured pass:

1. **Entity pass**: "List every Initiative, Person, Risk, Decision, and Compliance Obligation
   mentioned in this document. For each, note the entity type and the exact text that identifies it."
2. **Deduplication check**: "For each extracted entity, does it match an existing node in the
   graph (by name similarity, context, or explicit ID reference)? Flag any ambiguous matches for
   confirmation rather than merging automatically."
3. **Relationship pass**: "For each pair of entities that co-occur in this document, what
   relationship (if any) connects them, using only the relationship types defined in the schema?"
4. **Confidence flagging**: mark low-confidence extractions explicitly rather than silently
   including them — a knowledge graph with confident wrong data is worse than one with visible gaps.

## Anti-Patterns to Avoid
- **Silent merging**: never collapse two similarly-named entities into one without confirmation
- **Relationship invention**: don't infer a relationship type not explicitly supported by the
  text just because it seems plausible
- **Staleness**: a graph that isn't updated as source documents change becomes actively
  misleading — treat "last_updated" as a first-class field to check before trusting a query result
- **Over-modeling**: don't add entity types beyond the six defined here without a clear, recurring
  need — schema sprawl defeats the token-efficiency purpose of building this in the first place
