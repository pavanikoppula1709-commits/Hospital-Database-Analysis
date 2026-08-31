# Hospital-Database-Analysis
Healthcare database analytics using SQL for clinical operations and revenue growth tracking.
# 🏥 Hospital Operations & Revenue Analytics Using SQL

## 📌 Project Overview

This project focuses on analyzing hospital operational and financial data using **SQL** to generate actionable business insights.

The analysis uses data related to **patients, doctors, appointments, treatments, and billing** to understand patient demand, doctor utilization, treatment patterns, and revenue performance.

The goal is to help hospital management make **data-driven decisions related to resource allocation, operational efficiency, patient management, and revenue optimization**.

---

## 🎯 Business Problem

Hospitals generate large amounts of data across different operational areas, including patient registrations, doctor appointments, treatments, and billing. However, raw data alone does not provide management with clear visibility into operational performance or financial trends.

This project addresses the need to:

* Understand the overall patient volume
* Analyze patient demographics
* Measure doctor appointment workload
* Identify high-demand medical specializations
* Understand treatment frequency and costs
* Identify frequently visiting patients
* Compare doctor revenue performance
* Track monthly appointment trends
* Measure month-over-month revenue growth

---

## 🎯 Project Objectives

The main objectives of this project are to:

1. Analyze the hospital's patient population.
2. Understand doctor availability and workload.
3. Identify specialties with the highest patient demand.
4. Analyze appointment trends over time.
5. Identify frequently performed treatments.
6. Calculate average treatment costs.
7. Rank doctors based on revenue generated.
8. Identify patients with more than three visits.
9. Identify doctors whose appointment volume is above the average.
10. Calculate monthly revenue and month-over-month revenue growth.

---

## 🗂️ Database Structure

The project uses five main tables:

```text
PATIENTS
    │
    └──────────────┐
                   ↓
              APPOINTMENTS
              ↙           ↘
         DOCTORS        TREATMENTS
                            │
                            ↓
                         BILLING
```

### Main Tables

| Table          | Description                                        |
| -------------- | -------------------------------------------------- |
| `PATIENTS`     | Contains patient information and demographics      |
| `DOCTORS`      | Contains doctor information and specialization     |
| `APPOINTMENTS` | Contains patient appointment and visit information |
| `TREATMENTS`   | Contains treatment types and treatment costs       |
| `BILLING`      | Contains billing and revenue information           |

---

## 🔍 Key Business Questions

The SQL analysis answers the following business questions:

### Patient Analysis

* How many patients are registered in the hospital?
* What is the gender-wise distribution of patients?

### Doctor & Specialization Analysis

* How many doctors are available in each specialization?
* Which doctors have handled the highest number of appointments?
* Which specialization has the highest number of patient visits?
* Which doctors have appointment counts above the average?

### Appointment Analysis

* What is the total number of appointments?
* What is the monthly trend of patient appointments?

### Treatment Analysis

* What are the most frequently performed treatments?
* What is the average treatment cost for each treatment type?

### Revenue Analysis

* What is the total revenue generated?
* Which doctors generate the highest treatment revenue?
* How are doctors ranked based on revenue?
* What is the month-over-month revenue growth?

### Patient Behavior

* Which patients have visited the hospital more than three times?

---

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* SQL Joins
* Aggregate Functions
* CTEs
* Subqueries
* Window Functions
* Date & Time Functions

---

## 💻 SQL Concepts Demonstrated

This project demonstrates practical use of:

```text
SELECT
WHERE
GROUP BY
HAVING
ORDER BY
COUNT()
SUM()
AVG()
JOIN
CONCAT()
CTE (WITH)
Subqueries
RANK()
LAG()
YEAR()
MONTH()
MONTHNAME()
```

The project uses joins between doctors, appointments, and treatments to calculate doctor-level revenue and uses `RANK()` to compare doctors by revenue.

It also uses `LAG()` to compare monthly revenue with the previous month's revenue and calculate the revenue growth percentage.

---

## 📊 Key Analysis Areas

### 1. Patient Demographics

Patient volume and gender distribution were analyzed to understand the composition of the hospital's patient population.

### 2. Doctor Workload

Doctor appointment volumes were analyzed to identify doctors handling a high number of patient appointments.

### 3. Specialty Demand

Patient visits were grouped by doctor specialization to identify areas with higher patient demand.

### 4. Treatment Analysis

Treatment frequency and average treatment costs were analyzed to understand service utilization and treatment economics.

### 5. Doctor Revenue Performance

Doctors were ranked according to the revenue generated through treatments associated with their appointments.

### 6. Repeat Patient Analysis

Patients with more than three hospital visits were identified to understand frequent patient utilization.

### 7. Revenue Growth

Monthly billing revenue was analyzed and compared with the previous month to calculate month-over-month revenue growth.

---

## 📈 Business Insights

The analysis can help hospital management:

* Identify high-demand medical specialties
* Monitor doctor workload
* Improve appointment scheduling
* Support workforce and resource planning
* Understand frequently performed treatments
* Monitor treatment cost patterns
* Identify high-revenue doctors
* Analyze repeat patient behavior
* Track changes in monthly revenue
* Identify potential areas for operational and financial improvement

---

## 💡 Business Impact

The project transforms raw healthcare data into structured business insights.

```text
Raw Healthcare Data
        ↓
     SQL Analysis
        ↓
     KPIs & Trends
        ↓
 Business Insights
        ↓
Data-Driven Decisions
        ↓
Operational & Revenue Optimization
```

The analysis provides a foundation for hospital management to make informed decisions around **capacity planning, doctor utilization, patient management, treatment services, and financial performance**.

---

## 📁 Project Files

```text
Hospital-Healthcare-SQL-Analytics/
│
├── sql healthcare project.sql
└── README.md
```

### `sql healthcare project.sql`

Contains all SQL queries used for the healthcare analytics analysis, including patient, doctor, appointment, treatment, and revenue analysis.

---

## 🚀 How to Run the Project

### Step 1 — Install MySQL

Install **MySQL Server** and a MySQL client such as MySQL Workbench.

### Step 2 — Create the Database

Run:

```sql
CREATE DATABASE HEALTHCARE_ANALYTICS;
USE HEALTHCARE_ANALYTICS;
```

### Step 3 — Load the Tables

Create/load the required tables:

```text
PATIENTS
DOCTORS
APPOINTMENTS
TREATMENTS
BILLING
```

### Step 4 — Run the SQL Script

Open:

```text
sql healthcare project.sql
```

Execute the queries in MySQL Workbench.

---

## 📌 Sample Analytical Queries

### Find doctors with above-average appointment volume

The project uses a CTE to calculate appointment counts by doctor and then compares each doctor against the average appointment count.

### Calculate monthly revenue growth

Monthly revenue is calculated using billing data and compared against the previous month using `LAG()`.

---

## 🎓 Skills Demonstrated

This project demonstrates my ability to:

* Translate healthcare business questions into SQL queries
* Work with relational healthcare data
* Join multiple healthcare datasets
* Perform exploratory data analysis using SQL
* Calculate healthcare KPIs
* Analyze operational performance
* Analyze revenue performance
* Use advanced SQL techniques
* Convert raw data into business-oriented insights

---

## 👩‍💻 Author

**K. Pavana laxmi**

B.Pharmacy Graduate | Healthcare Data Analyst

**Skills:**
SQL | Python | Excel | Power BI | Healthcare Analytics

---

## ⭐ Project Outcome

> **A SQL-based healthcare analytics solution designed to provide visibility into hospital operations, patient demand, doctor utilization, treatment patterns, and revenue performance to support data-driven decision-making.**
