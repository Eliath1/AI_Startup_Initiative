# Governance Lifecycle — Stages, Checkpoints & RACI

*Loaded by the core skill when structuring governance across an initiative's full lifecycle,
or when setting up governance for a new organization's portfolio.*

---

## AI Lifecycle Stages

| Stage | Purpose | Exit Criteria |
|---|---|---|
| **1. Ideation** | Capture the use case, initial value hypothesis | Intake ticket created, Stage 1 scoring scheduled |
| **2. Evaluation** (Intake Stage 1 & 2) | Should we do this? How would we build it? | Scoring complete, gate decision recorded (Approve/Defer/Reject) |
| **3. Design** | Technical approach, data requirements, risk classification | EU AI Act risk tier assigned, architecture reviewed, compliance requirements scoped |
| **4. Build (PoC/MVP)** | Build and validate against success criteria | PoC/MVP demonstrates the value hypothesis; technical feasibility confirmed |
| **5. Pre-Production Review** | Governance gate before production exposure | Security review passed, compliance documentation complete, model evaluation results reviewed |
| **6. Production Deployment** | Live, serving real users/decisions | Monitoring active, rollback plan documented, ownership assigned |
| **7. Operate & Monitor** | Ongoing value tracking, drift monitoring, incident response | Recurring in the weekly/monthly governance cadence |
| **8. Review & Iterate** | Periodic reassessment of value delivered vs. business case | Quarterly business review includes this initiative |
| **9. Decommissioning** | Planned retirement | Data retention/deletion executed per policy, dependent systems migrated, decommission logged |

**Governance principle**: a control checkpoint exists at every stage transition — no initiative
advances to the next stage without its exit criteria met and documented. This is what "governance
by design, not audit afterthought" means operationally.

---

## Control Checkpoints by Stage

| Stage Transition | Required Checkpoint | Owner |
|---|---|---|
| Ideation → Evaluation | Intake ticket logged with business sponsor named | PM |
| Evaluation → Design | Stage 1 + Stage 2 scoring both passed threshold | PM + AI Strategy Lead |
| Design → Build | Risk classification assigned (EU AI Act tier or equivalent); data sourcing plan approved | System AI Architect |
| Build → Pre-Production | PoC/MVP success criteria met; initial security review scheduled | PM + Eng Lead |
| Pre-Production → Production | Full compliance checklist passed (see `references/legal-compliance-master.md`); rollback plan documented | InfoSec + Exec Sponsor |
| Production → Operate | Monitoring dashboards live; incident response owner assigned | Eng Lead |
| Operate → Review | Quarterly value-realization check against original business case | PM |
| Any stage → Decommissioning | Data retention/deletion plan approved; dependent-system impact assessed | Data Owner + Legal/Compliance |

---

## RACI Template (per initiative)

| Activity | PM | AI Strategy Lead | System AI Architect | InfoSec | Exec Sponsor | Budget Owner |
|---|---|---|---|---|---|---|
| Intake scoring | R | A | C | I | I | C |
| Technical feasibility assessment | C | I | A/R | C | I | I |
| Risk classification | C | I | R | A | I | I |
| Compliance sign-off | C | I | C | A/R | I | I |
| Budget approval | I | I | I | I | C | A |
| Production go/no-go | R | C | C | A | A | I |
| Weekly status reporting | R/A | I | I | I | I | I |
| Quarterly business review | R | C | I | I | A | C |

*R = Responsible · A = Accountable · C = Consulted · I = Informed. Adjust roles to match the
customer's actual org structure during onboarding — the roles above are the default template
referenced throughout the core skill (Part X, Decision Rights).*

---

## Applying This at Onboarding

When setting this skill up for a new organization, confirm:
1. Who holds each RACI role (may map to existing titles differently — e.g., "AI Strategy Lead"
   might be a VP of Data/AI, a Chief AI Officer, or a rotating committee)
2. Whether all nine lifecycle stages apply, or whether some are combined for a smaller organization
3. Which control checkpoints need to be adapted to existing tooling (e.g., if there's no formal
   pre-production review process yet, this may need to be established rather than assumed)
