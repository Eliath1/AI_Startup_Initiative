# Legal, Regulatory & InfoSec Compliance — Master Reference

*Loaded by the core skill when compliance depth is needed. This content is built on public
regulatory and security standards — cite-safe by nature — with a placeholder section for
organization-specific application.*

---

## A. Data Protection & Privacy (mandatory for all AI deployments)

| Standard | Scope | Key Requirements for AI |
|---|---|---|
| **GDPR** (EU Reg 2016/679) | Any EU data subject | Lawful basis for ML training · DPIAs for high-risk processing · right to explanation for automated decisions · data minimization in training sets · erasure impact on models |
| **CCPA/CPRA** | California residents | Opt-out of automated decision-making · data sale restrictions · model training data disclosure |
| **PIPEDA** | Canada | Consent for data use · accountability for third-party processors |

**AI-specific privacy controls required**:
- Training data provenance and consent documentation
- Model output traceability (can we explain why a decision was made?)
- Synthetic data governance (if used in training)
- Data retention policy applied to model weights and training artifacts
- Cross-border data transfer controls (SCCs, adequacy decisions)

---

## B. AI-Specific Regulatory Frameworks

| Framework | Status | Application |
|---|---|---|
| **EU AI Act** (2024) | In force; high-risk provisions phasing in | Risk classification required per AI system. High-risk systems (HR, finance, safety) require conformity assessment, human oversight, EU database registration. |
| **NIST AI RMF** (2023) | Voluntary US framework, increasingly required | Govern, Map, Measure, Manage — four functions addressed per system; AI risk profile required. |
| **OECD AI Principles** | International reference | Transparency, accountability, human oversight, robustness — embedded in governance gates. |
| **ISO/IEC 42001** | AI management system standard | Organizational AI governance structure, roles, continuous improvement cycle. |
| **NIST SP 800-218A** | Secure software dev for AI/ML | Secure ML pipeline, model integrity, adversarial robustness. |

**EU AI Act risk classification — apply to every initiative**:
- **Unacceptable Risk**: prohibited (real-time biometric surveillance, social scoring)
- **High Risk**: full conformity assessment (HR screening, credit scoring, safety systems)
- **Limited Risk**: transparency obligations (chatbots, content generation — must disclose AI involvement)
- **Minimal Risk**: no specific obligations (most recommendation/optimization use cases)

---

## C. Information Security Standards (mandatory for enterprise deployment)

| Standard | Requires | Application |
|---|---|---|
| **ISO 27001:2022** | ISMS certification, 93 Annex A controls | AI systems in ISMS scope · model access controls · training data classified and protected |
| **ISO 27002:2022** | Implementation guidance | Controls 5.23 (cloud security) · 8.10 (information deletion) · 8.25 (secure development lifecycle) |
| **SOC 2 Type II** | Security, Availability, Confidentiality, Processing Integrity, Privacy | AI vendor assessment required · annual audit · continuous monitoring evidence |
| **NIST CSF 2.0** | Govern · Identify · Protect · Detect · Respond · Recover | AI risk integrated into organizational risk register · incident response covers AI-specific failure modes |
| **CIS Controls v8** | 18 prioritized security controls | Controls 3 (data protection) · 14 (security awareness) · 16 (application security) apply to AI systems |

---

## D. Encryption Standards (AES-256 and beyond)

**Data at rest** — mandatory:
- AES-256 for all stored data: training datasets, model weights/checkpoints, inference logs and outputs, audit trails/compliance artifacts
- Key management: FIPS 140-2/3 validated HSM or KMS (AWS KMS, Azure Key Vault, GCP Cloud KMS)
- Key rotation: minimum annually, immediately upon suspected compromise
- Database encryption: Transparent Data Encryption (TDE) enabled

**Data in transit** — mandatory:
- TLS 1.3 minimum (TLS 1.2 acceptable only where 1.3 unsupported, document exception)
- No unencrypted data transmission over any network, including internal
- Certificate management: valid certs, no self-signed in production, automated renewal
- API communications: HTTPS enforced, HSTS headers

**Model security specific**:
- Model files encrypted at rest and in transit
- Model signing: cryptographic integrity verification before deployment
- Inference endpoint: authenticated, encrypted, rate-limited
- Training environment: network-isolated, encrypted storage, access-logged

---

## E. Identity & Access Management (IAM)

- Principle of Least Privilege: roles scoped to minimum necessary access
- MFA mandatory for all privileged accounts and production access
- Service accounts: no human credentials; machine identities with automated rotation
- Privileged Access Management (PAM): just-in-time access for production environments
- Access reviews: quarterly certification of all AI system access rights
- Zero Trust Architecture: verify explicitly, use least privilege, assume breach

---

## F. AI-Specific Security Controls

- **Model poisoning prevention**: data validation and integrity checks on training inputs
- **Adversarial robustness testing**: red-team exercises before production deployment
- **Model drift monitoring**: automated alerts when output distribution shifts beyond threshold
- **Hallucination rate monitoring**: tracked metric for generative AI systems in production
- **Prompt injection defense**: input sanitization and output filtering for LLM-based systems
- **Supply chain security**: third-party model/dataset provenance verification (SBOM equivalent for AI)
- **Explainability logging**: audit trail of model decisions for high-stakes outputs

---

## G. Industry-Specific Compliance (organization-configured)

For any initiative touching these domains, additional requirements typically apply — customize
per client engagement:
- **Finance/Quotation AI**: SR 11-7 (model risk management) · DORA (digital operational resilience) · SOX implications for automated financial decisions
- **HR/People Analytics**: Equal Employment Opportunity compliance · automated decision-making disclosure
- **Customer-facing AI**: consumer protection laws · accessibility standards (WCAG) · terms-of-service AI disclosure
- **Healthcare AI**: HIPAA (US) · clinical decision-support regulatory pathways where applicable
- **Public sector AI**: additional transparency/procurement rules per jurisdiction

*This section is intentionally the most client-specific part of the compliance stack — populate
with the regulatory frameworks relevant to each customer's industry during onboarding.*
