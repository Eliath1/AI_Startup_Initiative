# RAW ENTERPRISE PROJECT DATASET (JIRA, CRM & AI GIT ACTIVITY)
> **Data Type**: Unstructured & Semi-structured Raw Logs  
> **Purpose**: Input benchmark for Cursor AI Skills, RAG Engines, and Agentic Dashboards.

---

## SECTION 1: JIRA SPRINT DUMP (JSON DATA ENCODED)

```json
{
  "system_export_timestamp": "2026-03-31T23:59:59Z",
  "project_keys": ["APEX", "AIAG", "IOTP"],
  "issues": [
    {
      "key": "APEX-101",
      "project_id": "PRJ-001",
      "summary": "Foundation Concrete Pouring & Rebar Grade 60 Sourcing",
      "issue_type": "Epic",
      "status": "Closed",
      "assignee": "cmendez@construction-group.com",
      "created_at": "2025-01-10T08:00:00Z",
      "closed_at": "2025-03-15T17:30:00Z",
      "customfield_actual_cost": 1281500.00,
      "customfield_vendor": "Cemex & Nucor Steel",
      "worklogs": [
        {"author": "cmendez", "time_spent_hours": 120, "comment": "Pouring baseline completed for basements B1-B3."},
        {"author": "sjenkins", "time_spent_hours": 45, "comment": "Rebar price fluctuation mitigated via volume hedge contract."}
      ]
    },
    {
      "key": "APEX-204",
      "project_id": "PRJ-001",
      "summary": "CRM Sales Campaign Launch for 2BR Premium Units",
      "issue_type": "Story",
      "status": "Closed",
      "assignee": "erostova@realestate-sales.com",
      "created_at": "2025-09-01T09:15:00Z",
      "closed_at": "2025-10-31T18:00:00Z",
      "customfield_monthly_revenue": 8950000.00,
      "customfield_units_sold": 20,
      "customfield_top_unit_type": "2BR Premium",
      "description": "October sales push resulted in 11 2BR units closed, making it the highest single-month revenue period ($8.95M)."
    },
    {
      "key": "AIAG-301",
      "project_id": "PRJ-002",
      "summary": "Subcontractor Risk Predictor Model Training",
      "issue_type": "Feature",
      "status": "In Production",
      "assignee": "dchen@tech-ai.com",
      "created_at": "2025-02-01T10:00:00Z",
      "customfield_investment_cost": 820000.00,
      "customfield_value_generated": 2170000.00,
      "customfield_peak_month": "2026-03",
      "metrics": {
        "accuracy_score": 0.942,
        "cost_avoidance_march_2026": 1200000.00,
        "top_feature": "Subcontractor Risk & Variance Predictor"
      }
    },
    {
      "key": "IOTP-405",
      "project_id": "PRJ-003",
      "summary": "HVAC Sensor Deployment & Predictive Maintenance Engine",
      "issue_type": "Feature",
      "status": "Verified",
      "assignee": "mvance@smartiot.com",
      "created_at": "2025-04-12T11:20:00Z",
      "customfield_investment_cost": 1100000.00,
      "customfield_value_generated": 1850000.00,
      "customfield_peak_month": "2025-11",
      "metrics": {
        "energy_reduction_pct": 28.4,
        "peak_savings_month": "November 2025",
        "top_capability": "HVAC AI Optimization Engine"
      }
    }
  ]
}
```

---

## SECTION 2: UNSTRUCTURED DAILY PROJECT WORKLOGS & INCIDENT NOTES

### Log Entry: 2025-10-28 (Sales & CRM Ops)
* **Author**: Elena Rostova
* **Project**: APEX TOWER (PRJ-001)
* **Note**: Reached target velocity for October. Total units closed this month: 20 units (5 1BR, 11 2BR, 4 3BR Penthouse). Total gross sales revenue: **$8,950,000 USD**. The 2BR Premium floor plan is outperforming all other layouts (38 total units sold to date out of 45 available).

### Log Entry: 2026-03-15 (AI Value Realization Audit)
* **Author**: Dr. David Chen
* **Project**: Enterprise AI Ops Agent (PRJ-002)
* **Note**: Completed Q1 Value Realization audit. The Subcontractor Risk Predictor tool flagged 14 material over-billing anomalies in March 2026 alone, saving $1,200,000 USD in cost avoidance. Total cumulative investment in PRJ-002 stands at $2,150,000 USD vs total value created of $4,320,000 USD (Net ROI: 100.9%).

---

## SECTION 3: GIT COMMIT HISTORY (CURSOR AGENT BENCHMARK)

```text
commit c8f921a9d4f01
Author: Eliath Guzman <eguzman@enterprise.com>
Date:   Wed Mar 18 14:20:10 2026 -0600

    feat(analytics): add value realization dashboard aggregation prompt
    
    - Target: Read Raw_CapEx_Ledger and Raw_CRM_Units_Sales
    - Compute: Project Investment Total, Net ROI, Best Sales Month, and Top Product
    - Verified against CFO Ledger GL-5000 series
```
