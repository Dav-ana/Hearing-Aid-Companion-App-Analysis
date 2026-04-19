# Product Analytics: Hearing Aid Companion App — Onboarding Funnel, Pairing Friction Analysis & A/B Test Proposal | MedTech

---

## Executive Summary

This project analyses a hearing aid company (Auraex) event log data over a 30 day period (January 2025, 300 users), looking at the onboarding process and identifying device pairing failures. Of users who successfully paired, **95.8% went on to adjust their volume**, confirming the app delivers immediate value once onboarding is complete.

However, **179 users failed to pair** at some point during their use of the app, with a specific segment (Android B-Series) representing **343 out of 475 pairing failures**. Affected users attempted to pair an average of **2.6 times**, suggesting high intent but a potential technical blockage preventing connection.

An A/B test proposal recommended a **Connection Assistant** for Android B-Series users to establish whether the issue is user error or technical incompatibility. Next steps include implementing the Connection Assistant and investigating potential firmware incompatibility between Android and the B-Series chipset.

---

## Business Problem

The goal of this project is to identify whether the companion app is functioning optimally and providing its intended benefit of user control and autonomy with their hearing devices, as well as identifying issues with connection and finding solutions to resolve any problems discovered.

Hearing aid connection is critical. The inability to connect to the companion app represents not only a poor user experience but a potential clinical risk. If users lose their ability to adjust hearing aid settings independently, this directly impacts their quality of life and Auraex's product reputation.

---

## Methodology

| Method | Description | Tools |
|--------|-------------|-------|
| Data Validation | Null checks, distinct value checks, date range validation | SQL |
| Event Log Analysis | Querying data to identify patterns | SQL, Power Query |
| Onboarding Funnel Analysis | Investigating the onboarding pathway from app open → Bluetooth search → device paired | SQL, Power BI |
| Pairing Friction Analysis | Investigating pairing failures across specific segments to identify significant patterns | SQL, Power BI, Power Query |
| Engagement Analysis | Comparing app feature usage between users who successfully paired and those who did not | SQL |
| A/B Test Proposal | Designed a randomised controlled test to evaluate the effectiveness of a Connection Assistant for Android B-Series users | — |

---

## Skills

### SQL (T-SQL / SSMS)
- Aggregate functions — `COUNT`, `SUM`, `AVG`
- Conditional aggregation — `CASE WHEN` inside aggregate functions
- Subqueries — filtering based on results of inner queries
- CTEs (Common Table Expressions) — structuring complex queries using `WITH`
- Data validation — null checks, distinct value checks, date range validation
- Funnel analysis — counting distinct users at each onboarding stage
- Segmentation — grouping and filtering by user cohort

### Power BI
- DAX measures — `CALCULATE`, `DISTINCTCOUNT`, `DIVIDE`, `LASTNONBLANK`
- Conditional formatting — highlighting critical values in matrix visuals
- Data modelling — connecting transformed tables from Power Query
- Visuals — KPI cards, funnel charts, matrix, clustered bar charts

### Power Query
- Data transformation — replacing values, capitalising text
- Merging columns — creating `device_os_model` segment column
- Calculated columns — building `failures_per_user` aggregation table

### Domain Knowledge
- Clinically informed data design — Aha! Moment (volume adjust) defined using audiological reasoning
- Understanding of hearing aid companion app user behaviour and Bluetooth pairing protocols

---
