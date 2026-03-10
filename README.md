# 🏥 Healthcare Patient Analytics — SQL Project

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0-blue) ![Status](https://img.shields.io/badge/Status-Completed-brightgreen) ![Portfolio](https://img.shields.io/badge/Type-Portfolio%20Project-orange)

## 📌 Project Overview

This project analyzes a hospital's patient database to uncover actionable business insights around **patient behavior**, **doctor performance**, and **billing trends**. It was built as part of a Business Analytics portfolio to demonstrate real-world SQL skills using MySQL.

The project simulates the kind of analysis a **Healthcare Business Analyst** would deliver to hospital management and finance teams to support data-driven decision making.

---

## 🎯 Business Questions Answered

| # | Business Question | Category |
|---|---|---|
| 1 | Which age group is admitted most frequently? | Patient Behavior |
| 2 | What are the top 5 most common diagnoses? | Patient Behavior |
| 3 | Are any patients re-admitted within 30 days? | Patient Behavior |
| 4 | What percentage of bills are unpaid? | Billing Analysis |
| 5 | Which doctor carries the highest patient load? | Performance Tracking |
| 6 | Which department has the longest average patient stay? | Performance Tracking |
| 7 | What is the monthly trend of new admissions? | Trends & Forecasting |
| 8 | Which doctor has the best treatment success rate? | Performance Tracking |
| 9 | What is the average billing amount by diagnosis? | Billing Analysis |
| 10 | Which months have the highest unpaid invoice rates? | Billing Analysis |

---

## 🗄️ Database Structure

The database consists of **4 tables** with **30 patient records** spanning January–April 2024.

```
doctors        → Doctor details, department, specialty, experience
patients       → Patient demographics, diagnosis, admission & discharge dates
appointments   → Appointment type, date, and treatment outcome
billing        → Treatment cost, insurance coverage, payment status
```

### Entity Relationship Overview
```
doctors ──< patients ──< billing
doctors ──< appointments
patients ──< appointments
```

---

## 🔍 Key Findings

- **Seniors (61+)** make up the largest patient group, highlighting the need for stronger geriatric care resources
- **Heart-related conditions** (Heart Attack + Heart Failure) are the most common diagnoses, making Cardiology the most resource-intensive department
- **Dr. Sarah Johnson** carries the highest patient load in Cardiology — an additional cardiologist may be needed to prevent burnout
- **Oncology** has the longest average patient stays, consuming the most bed capacity and nursing hours
- **Cancer treatments** generate the highest revenue per patient but also carry the largest insurance gaps
- **Unpaid invoices** peak in certain months, creating cash flow gaps that require targeted collections outreach

---

## 🛠️ SQL Skills Demonstrated

| Skill | Used In |
|---|---|
| `CASE WHEN` | Age group segmentation, status tracking |
| `GROUP BY` / `HAVING` | Aggregating data by category |
| `JOIN` (INNER, Self) | Connecting multiple tables |
| `Subqueries` | Percentage calculations |
| `DATEDIFF` | Calculating length of stay & re-admissions |
| `Window Functions` (SUM OVER) | Running totals for trend analysis |
| `SUM(CASE WHEN)` | KPI tracking & performance metrics |
| `AVG`, `MIN`, `MAX` | Statistical summaries |
| `MONTHNAME`, `MONTH` | Time-based trend analysis |
| Financial calculations | Revenue, outstanding balances, insurance gaps |

---

## 🚀 How to Run This Project

1. Go to **[db-fiddle.com](https://www.db-fiddle.com)**
2. Select **MySQL 8.0** from the top left dropdown
3. Copy the full contents of `healthcare_analytics.sql`
4. Paste into the **left panel** (Schema SQL)
5. Click **Run**
6. Copy any individual query from **Section 3** into the **right panel** to explore results

---

## 📁 File Structure

```
healthcare-sql-analytics/
│
├── healthcare_analytics.sql   # Full project — setup + all 10 queries
└── README.md                  # Project documentation
```

---

## 💡 Future Improvements

- Add more patients across a full 12-month period for richer trend analysis
- Include a `staff` table to track nurse-to-patient ratios
- Build a dashboard on top of this data using **Tableau** or **Power BI**
- Add stored procedures for automated monthly reporting

---

## 👤 About

This project was built as part of a **Business Analytics portfolio** to demonstrate practical SQL skills in a real-world healthcare context.

Feel free to fork this repository, explore the queries, and adapt the database for your own learning!

---

⭐ *If you found this project useful, consider giving it a star on GitHub!*
