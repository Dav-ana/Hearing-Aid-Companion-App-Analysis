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
## Results and Business Recommendations

### 🔵 Onboarding Funnel
**Finding:** 216 out of 300 users (72%) successfully paired their device with the app. Of the 241 users who initiated a Bluetooth search, 25 never completed pairing, representing a 10.4% drop-off at the most critical onboarding step.

**Impact:** Nearly 1 in 10 users who attempted to connect their hearing aid were unable to complete setup, meaning they could not access the core functionality of the app. For a hearing aid user, this is not just a frustrating experience but a barrier to managing their own hearing health independently.

**Recommendation:** Investigate what is preventing users from completing pairing after initiating a Bluetooth search. Data suggests the obstacle is concentrated in a specific segment — see Pairing Failure findings below.

---

### 🟢 Aha! Moment
**Finding:** 95.8% of users who successfully paired went on to adjust their volume, confirming that volume adjustment is the primary Aha! Moment for Auraex app users.

**Impact:** The vast majority of connected users immediately engaged with a core feature, demonstrating that the app delivers clear value once onboarding is complete. The product itself is not the problem.

**Recommendation:** Resolving the pairing failure issue is the single highest priority action. The data shows that once users successfully connect, they engage with the app immediately and consistently. Reducing pairing friction will directly increase feature engagement and user satisfaction.

---

### 🔴 Pairing Failure
**Finding:** 179 users experienced at least one pairing failure during the 30 day period, generating 475 failure events in total. A single segment, Android B-Series users, accounted for 343 of those failures (72.2%) despite representing only 25% of the user base. 98.6% of Android B-Series users experienced at least one failure, with affected users attempting to pair an average of 2.6 times. Only 1.12% of affected users never returned, indicating persistent intent to connect.

**Impact:** The pairing failure problem is not evenly distributed, it is concentrated almost entirely in one segment. This represents a critical product risk. If the B-Series is a flagship or premium model, a 98.6% failure rate in Android users is a reputational and revenue concern that requires urgent attention.

**Recommendation:** An A/B test proposal has been designed to evaluate the effectiveness of a Connection Assistant for Android B-Series users. This will establish whether the issue is user error or a fundamental firmware incompatibility, allowing the product and engineering teams to take targeted action. The full proposal is available in the repository. 

---

## Next Steps & Limitations

### Limitations

- **Generated data:** This is not real world data so patterns were intentionally planted
- **Data only represented a 30 day period:** Users labelled "not paired" may have paired before the window and lost connection, attempting to pair again within the period investigated
- **Small Android B-Series sample size (74 users):** This limits the statistical significance of the A/B test
- **No `bluetooth_handshake` event:** The exact point where the connection process failures occurred could not be identified
- **Account setup order:** Clinical domain knowledge identified that device pairing occurs before account setup, which affected the initial funnel interpretation and is worth noting for future analysis design
- **Older demographic:** This may not be reflected in the data as real world data could potentially show different engagement patterns

### Next Steps

- Extend analysis to a full annual quarter for more robust findings
- Implement and monitor the Connection Assistant A/B test
- Investigate firmware compatibility between Android OS and B-Series chipset
- Collect more granular Bluetooth connection events to identify the exact failure point
- Repeat analysis with real world data if Auraex were a real company

---
## Repository Structure

| Folder | Contents |
|--------|----------|
| [📂 Data](./Data) | Event log dataset — `hearing_aid_app_event_logs.csv` |
| [📂 SQL](./SQL) | Four SQL analysis files covering validation, funnel, pairing failure and engagement analysis |
| [📂 Dashboard](./Dashboard) | Power BI dashboard file — `auraex_companion_app.pbix` |
| [📂 Proposal](./Proposal) | A/B test proposal — Connection Assistant for Android B-Series users |
