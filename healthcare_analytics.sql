-- ============================================================
--        HEALTHCARE PATIENT ANALYTICS PROJECT
--        Created for: Business Analytics Portfolio
--        Database: MySQL 8.0
--        Description: Analyzing patient behavior and hospital
--                     performance using SQL
-- ============================================================


-- ============================================================
-- SECTION 1: DATABASE SETUP - CREATE TABLES
-- ============================================================

-- DOCTORS TABLE
CREATE TABLE doctors (
  doctor_id INT PRIMARY KEY,
  doctor_name VARCHAR(100),
  department VARCHAR(100),
  specialty VARCHAR(100),
  years_experience INT
);

-- PATIENTS TABLE
CREATE TABLE patients (
  patient_id INT PRIMARY KEY,
  patient_name VARCHAR(100),
  age INT,
  gender VARCHAR(10),
  diagnosis VARCHAR(150),
  admission_date DATE,
  discharge_date DATE,
  doctor_id INT,
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- APPOINTMENTS TABLE
CREATE TABLE appointments (
  appointment_id INT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  appointment_date DATE,
  appointment_type VARCHAR(50),
  outcome VARCHAR(100),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- BILLING TABLE
CREATE TABLE billing (
  bill_id INT PRIMARY KEY,
  patient_id INT,
  treatment_cost DECIMAL(10,2),
  insurance_covered DECIMAL(10,2),
  amount_paid DECIMAL(10,2),
  payment_status VARCHAR(20),
  bill_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);


-- ============================================================
-- SECTION 2: INSERT SAMPLE DATA
-- ============================================================

INSERT INTO doctors VALUES
(1, 'Dr. Sarah Johnson', 'Cardiology',  'Heart Disease',  15),
(2, 'Dr. Michael Lee',   'Neurology',   'Brain & Spine',  10),
(3, 'Dr. Priya Patel',   'Pediatrics',  'Child Health',    8),
(4, 'Dr. James Carter',  'Orthopedics', 'Bone & Joint',   12),
(5, 'Dr. Emily Brooks',  'Cardiology',  'Heart Surgery',  20),
(6, 'Dr. Omar Hassan',   'Oncology',    'Cancer Care',    17),
(7, 'Dr. Lisa Nguyen',   'Neurology',   'Stroke Care',     9),
(8, 'Dr. David Kim',     'Pediatrics',  'Neonatal Care',   6);

INSERT INTO patients VALUES
(1,  'Alice Martin',   67, 'Female', 'Heart Attack',          '2024-01-05', '2024-01-12', 1),
(2,  'Bob Thompson',   45, 'Male',   'Stroke',                '2024-01-08', '2024-01-20', 2),
(3,  'Clara Hughes',   32, 'Female', 'Asthma',                '2024-01-10', '2024-01-13', 3),
(4,  'David Park',     78, 'Male',   'Heart Failure',         '2024-01-15', '2024-01-25', 1),
(5,  'Emma Wilson',    55, 'Female', 'Knee Replacement',      '2024-01-18', '2024-01-24', 4),
(6,  'Frank Russo',    62, 'Male',   'Lung Cancer',           '2024-01-20', '2024-02-05', 6),
(7,  'Grace Kim',      29, 'Female', 'Migraine',              '2024-01-22', '2024-01-23', 7),
(8,  'Henry Brown',    71, 'Male',   'Heart Attack',          '2024-02-01', '2024-02-10', 5),
(9,  'Isla Davis',      8, 'Female', 'Pneumonia',             '2024-02-03', '2024-02-08', 3),
(10, 'Jack Evans',     50, 'Male',   'Back Surgery',          '2024-02-05', '2024-02-12', 4),
(11, 'Karen White',    66, 'Female', 'Heart Failure',         '2024-02-08', '2024-02-18', 1),
(12, 'Leo Turner',     40, 'Male',   'Brain Tumor',           '2024-02-10', '2024-03-01', 2),
(13, 'Mia Scott',       3, 'Female', 'Fever & Infection',     '2024-02-12', '2024-02-15', 8),
(14, 'Nathan Clark',   58, 'Male',   'Prostate Cancer',       '2024-02-15', '2024-03-02', 6),
(15, 'Olivia Adams',   35, 'Female', 'Stroke',                '2024-02-18', '2024-02-28', 7),
(16, 'Paul Mitchell',  80, 'Male',   'Heart Attack',          '2024-03-01', '2024-03-10', 5),
(17, 'Quinn Baker',    22, 'Female', 'Appendicitis',          '2024-03-03', '2024-03-06', 4),
(18, 'Ryan Hall',      47, 'Male',   'Diabetes Complication', '2024-03-05', '2024-03-12', 1),
(19, 'Sophia Allen',   11, 'Female', 'Asthma',                '2024-03-07', '2024-03-10', 3),
(20, 'Tom Young',      63, 'Male',   'Lung Cancer',           '2024-03-10', '2024-03-28', 6),
(21, 'Uma Nelson',     54, 'Female', 'Knee Replacement',      '2024-03-12', '2024-03-18', 4),
(22, 'Victor Perez',   76, 'Male',   'Heart Failure',         '2024-03-15', '2024-03-25', 1),
(23, 'Wendy Collins',  39, 'Female', 'Migraine',              '2024-03-18', '2024-03-19', 7),
(24, 'Xander Reed',    68, 'Male',   'Stroke',                '2024-03-20', '2024-04-01', 2),
(25, 'Yara James',      5, 'Female', 'Pneumonia',             '2024-03-22', '2024-03-27', 8),
(26, 'Zane Morris',    55, 'Male',   'Back Surgery',          '2024-03-25', '2024-04-02', 4),
(27, 'Amy Foster',     70, 'Female', 'Heart Attack',          '2024-04-01', '2024-04-09', 5),
(28, 'Brian Cox',      44, 'Male',   'Brain Tumor',           '2024-04-03', '2024-04-20', 2),
(29, 'Chloe Ward',     27, 'Female', 'Appendicitis',          '2024-04-05', '2024-04-08', 4),
(30, 'Derek Price',    83, 'Male',   'Heart Failure',         '2024-04-08', '2024-04-20', 1);

INSERT INTO appointments VALUES
(1,  1,  1, '2024-01-20', 'Follow-up', 'Recovered'),
(2,  2,  2, '2024-02-01', 'Follow-up', 'Ongoing Treatment'),
(3,  3,  3, '2024-01-25', 'Follow-up', 'Recovered'),
(4,  4,  1, '2024-02-05', 'Emergency', 'Critical'),
(5,  5,  4, '2024-02-10', 'Follow-up', 'Recovered'),
(6,  6,  6, '2024-02-20', 'Checkup',   'Ongoing Treatment'),
(7,  7,  7, '2024-02-01', 'Follow-up', 'Recovered'),
(8,  8,  5, '2024-02-20', 'Follow-up', 'Recovered'),
(9,  9,  3, '2024-02-20', 'Follow-up', 'Recovered'),
(10, 10, 4, '2024-02-25', 'Follow-up', 'Recovered'),
(11, 11, 1, '2024-03-01', 'Follow-up', 'Ongoing Treatment'),
(12, 12, 2, '2024-03-15', 'Checkup',   'Critical'),
(13, 13, 8, '2024-03-01', 'Follow-up', 'Recovered'),
(14, 14, 6, '2024-03-15', 'Checkup',   'Ongoing Treatment'),
(15, 15, 7, '2024-03-10', 'Follow-up', 'Recovered'),
(16, 16, 5, '2024-03-20', 'Follow-up', 'Recovered'),
(17, 17, 4, '2024-03-15', 'Follow-up', 'Recovered'),
(18, 18, 1, '2024-03-25', 'Emergency', 'Ongoing Treatment'),
(19, 19, 3, '2024-03-22', 'Follow-up', 'Recovered'),
(20, 20, 6, '2024-04-10', 'Checkup',   'Critical'),
(21, 21, 4, '2024-04-01', 'Follow-up', 'Recovered'),
(22, 22, 1, '2024-04-05', 'Emergency', 'Critical'),
(23, 23, 7, '2024-04-01', 'Follow-up', 'Recovered'),
(24, 24, 2, '2024-04-12', 'Follow-up', 'Ongoing Treatment'),
(25, 25, 8, '2024-04-08', 'Follow-up', 'Recovered'),
(26, 26, 4, '2024-04-15', 'Follow-up', 'Recovered'),
(27, 27, 5, '2024-04-20', 'Follow-up', 'Recovered'),
(28, 28, 2, '2024-05-05', 'Checkup',   'Critical'),
(29, 29, 4, '2024-04-18', 'Follow-up', 'Recovered'),
(30, 30, 1, '2024-05-01', 'Emergency', 'Critical');

INSERT INTO billing VALUES
(1,  1,  15000.00, 12000.00, 12000.00, 'Paid',    '2024-01-13'),
(2,  2,  22000.00, 18000.00, 18000.00, 'Paid',    '2024-01-21'),
(3,  3,   3500.00,  2000.00,  2000.00, 'Paid',    '2024-01-14'),
(4,  4,  18000.00, 10000.00,     0.00, 'Unpaid',  '2024-01-26'),
(5,  5,  25000.00, 20000.00, 20000.00, 'Paid',    '2024-01-25'),
(6,  6,  45000.00, 30000.00, 15000.00, 'Partial', '2024-02-06'),
(7,  7,   1200.00,  1000.00,  1000.00, 'Paid',    '2024-01-24'),
(8,  8,  17000.00, 14000.00, 14000.00, 'Paid',    '2024-02-11'),
(9,  9,   4500.00,  3500.00,  3500.00, 'Paid',    '2024-02-09'),
(10, 10, 28000.00, 20000.00,     0.00, 'Unpaid',  '2024-02-13'),
(11, 11, 16000.00, 10000.00,  5000.00, 'Partial', '2024-02-19'),
(12, 12, 55000.00, 35000.00, 35000.00, 'Paid',    '2024-03-02'),
(13, 13,  2800.00,  2000.00,  2000.00, 'Paid',    '2024-02-16'),
(14, 14, 48000.00, 30000.00,     0.00, 'Unpaid',  '2024-03-03'),
(15, 15, 20000.00, 16000.00, 16000.00, 'Paid',    '2024-03-01'),
(16, 16, 16500.00, 13000.00, 13000.00, 'Paid',    '2024-03-11'),
(17, 17,  8000.00,  6000.00,  6000.00, 'Paid',    '2024-03-07'),
(18, 18, 12000.00,  8000.00,  4000.00, 'Partial', '2024-03-13'),
(19, 19,  3200.00,  2500.00,  2500.00, 'Paid',    '2024-03-11'),
(20, 20, 50000.00, 35000.00,     0.00, 'Unpaid',  '2024-03-29'),
(21, 21, 24000.00, 18000.00, 18000.00, 'Paid',    '2024-03-19'),
(22, 22, 19000.00, 12000.00,     0.00, 'Unpaid',  '2024-03-26'),
(23, 23,  1100.00,  1000.00,  1000.00, 'Paid',    '2024-03-20'),
(24, 24, 21000.00, 15000.00, 15000.00, 'Paid',    '2024-04-02'),
(25, 25,  4200.00,  3000.00,  3000.00, 'Paid',    '2024-03-28'),
(26, 26, 27000.00, 20000.00, 10000.00, 'Partial', '2024-04-03'),
(27, 27, 15500.00, 12000.00, 12000.00, 'Paid',    '2024-04-10'),
(28, 28, 52000.00, 35000.00,     0.00, 'Unpaid',  '2024-04-21'),
(29, 29,  7500.00,  6000.00,  6000.00, 'Paid',    '2024-04-09'),
(30, 30, 17000.00, 10000.00,  5000.00, 'Partial', '2024-04-21');


-- ============================================================
-- SECTION 3: BUSINESS ANALYTICS QUERIES
-- ============================================================


-- ------------------------------------------------------------
-- QUERY 1: Which Age Group is Admitted Most?
-- Skills: CASE WHEN, GROUP BY, COUNT, ORDER BY
-- Insight: Helps hospital allocate resources by patient age
-- ------------------------------------------------------------
SELECT
  CASE
    WHEN age BETWEEN 0 AND 17  THEN 'Child (0-17)'
    WHEN age BETWEEN 18 AND 40 THEN 'Young Adult (18-40)'
    WHEN age BETWEEN 41 AND 60 THEN 'Middle Aged (41-60)'
    ELSE 'Senior (61+)'
  END AS age_group,
  COUNT(*) AS total_patients
FROM patients
GROUP BY age_group
ORDER BY total_patients DESC;


-- ------------------------------------------------------------
-- QUERY 2: Top 5 Most Common Diagnoses
-- Skills: Subquery, COUNT, ROUND, LIMIT
-- Insight: Identifies which conditions drive most admissions
-- ------------------------------------------------------------
SELECT
  diagnosis,
  COUNT(*) AS total_cases,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 1) AS percentage
FROM patients
GROUP BY diagnosis
ORDER BY total_cases DESC
LIMIT 5;


-- ------------------------------------------------------------
-- QUERY 3: Patients Re-admitted Within 30 Days
-- Skills: Self JOIN, DATEDIFF, table aliases
-- Insight: Flags gaps in post-discharge care quality
-- ------------------------------------------------------------
SELECT
  p1.patient_name,
  p1.diagnosis,
  p1.discharge_date AS first_discharge,
  p2.admission_date AS readmission_date,
  DATEDIFF(p2.admission_date, p1.discharge_date) AS days_between
FROM patients p1
JOIN patients p2
  ON p1.patient_name = p2.patient_name
  AND p2.admission_date > p1.discharge_date
  AND DATEDIFF(p2.admission_date, p1.discharge_date) <= 30
ORDER BY days_between ASC;


-- ------------------------------------------------------------
-- QUERY 4: Payment Status Breakdown
-- Skills: SUM, COUNT, percentage calculation, GROUP BY
-- Insight: Tracks outstanding revenue and cash flow risk
-- ------------------------------------------------------------
SELECT
  payment_status,
  COUNT(*) AS total_bills,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM billing), 1) AS percentage,
  SUM(treatment_cost) AS total_amount,
  SUM(amount_paid) AS total_collected,
  SUM(treatment_cost - amount_paid) AS total_outstanding
FROM billing
GROUP BY payment_status
ORDER BY total_outstanding DESC;


-- ------------------------------------------------------------
-- QUERY 5: Doctor Patient Load & Average Stay
-- Skills: JOIN, AVG, DATEDIFF, GROUP BY
-- Insight: Identifies overloaded doctors for workload balancing
-- ------------------------------------------------------------
SELECT
  d.doctor_name,
  d.department,
  d.specialty,
  COUNT(p.patient_id) AS total_patients,
  ROUND(AVG(DATEDIFF(p.discharge_date, p.admission_date)), 1) AS avg_stay_days
FROM doctors d
JOIN patients p ON d.doctor_id = p.doctor_id
GROUP BY d.doctor_id, d.doctor_name, d.department, d.specialty
ORDER BY total_patients DESC;


-- ------------------------------------------------------------
-- QUERY 6: Department Average Patient Stay
-- Skills: JOIN, AVG, MIN, MAX, GROUP BY
-- Insight: Shows which departments consume most bed capacity
-- ------------------------------------------------------------
SELECT
  d.department,
  COUNT(p.patient_id) AS total_patients,
  ROUND(AVG(DATEDIFF(p.discharge_date, p.admission_date)), 1) AS avg_stay_days,
  MIN(DATEDIFF(p.discharge_date, p.admission_date)) AS shortest_stay,
  MAX(DATEDIFF(p.discharge_date, p.admission_date)) AS longest_stay
FROM doctors d
JOIN patients p ON d.doctor_id = p.doctor_id
GROUP BY d.department
ORDER BY avg_stay_days DESC;


-- ------------------------------------------------------------
-- QUERY 7: Monthly Admission Trends
-- Skills: MONTHNAME, MONTH, Window Function (SUM OVER)
-- Insight: Tracks admission growth to forecast staffing needs
-- ------------------------------------------------------------
SELECT
  MONTHNAME(admission_date) AS month_name,
  MONTH(admission_date) AS month_number,
  COUNT(*) AS total_admissions,
  SUM(COUNT(*)) OVER (ORDER BY MONTH(admission_date)) AS running_total
FROM patients
GROUP BY MONTH(admission_date), MONTHNAME(admission_date)
ORDER BY month_number ASC;


-- ------------------------------------------------------------
-- QUERY 8: Doctor Treatment Success Rate
-- Skills: SUM(CASE WHEN), JOIN, performance KPI tracking
-- Insight: Benchmarks doctor performance by patient recovery
-- ------------------------------------------------------------
SELECT
  d.doctor_name,
  d.department,
  COUNT(a.appointment_id) AS total_appointments,
  SUM(CASE WHEN a.outcome = 'Recovered'         THEN 1 ELSE 0 END) AS recovered_patients,
  SUM(CASE WHEN a.outcome = 'Ongoing Treatment' THEN 1 ELSE 0 END) AS ongoing_patients,
  SUM(CASE WHEN a.outcome = 'Critical'          THEN 1 ELSE 0 END) AS critical_patients,
  ROUND(SUM(CASE WHEN a.outcome = 'Recovered'   THEN 1 ELSE 0 END) * 100.0
    / COUNT(a.appointment_id), 1) AS recovery_rate_percent
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name, d.department
ORDER BY recovery_rate_percent DESC;


-- ------------------------------------------------------------
-- QUERY 9: Average Billing Amount by Diagnosis
-- Skills: Multi-table JOIN, AVG, SUM, financial analysis
-- Insight: Identifies highest revenue diagnoses and insurance gaps
-- ------------------------------------------------------------
SELECT
  p.diagnosis,
  COUNT(*) AS total_patients,
  ROUND(AVG(b.treatment_cost), 2) AS avg_treatment_cost,
  ROUND(AVG(b.insurance_covered), 2) AS avg_insurance_covered,
  ROUND(AVG(b.treatment_cost - b.insurance_covered), 2) AS avg_patient_responsibility,
  ROUND(SUM(b.treatment_cost), 2) AS total_revenue
FROM patients p
JOIN billing b ON p.patient_id = b.patient_id
GROUP BY p.diagnosis
ORDER BY avg_treatment_cost DESC;


-- ------------------------------------------------------------
-- QUERY 10: Monthly Unpaid Invoice Rate
-- Skills: MONTHNAME + SUM(CASE WHEN) + financial tracking
-- Insight: Pinpoints months with cash flow gaps for finance team
-- ------------------------------------------------------------
SELECT
  MONTHNAME(b.bill_date) AS month_name,
  MONTH(b.bill_date) AS month_number,
  COUNT(*) AS total_bills,
  SUM(CASE WHEN b.payment_status = 'Paid'    THEN 1 ELSE 0 END) AS paid_count,
  SUM(CASE WHEN b.payment_status = 'Unpaid'  THEN 1 ELSE 0 END) AS unpaid_count,
  SUM(CASE WHEN b.payment_status = 'Partial' THEN 1 ELSE 0 END) AS partial_count,
  ROUND(SUM(CASE WHEN b.payment_status = 'Unpaid' THEN 1 ELSE 0 END)
    * 100.0 / COUNT(*), 1) AS unpaid_rate_percent,
  ROUND(SUM(CASE WHEN b.payment_status = 'Unpaid'
    THEN b.treatment_cost ELSE 0 END), 2) AS total_unpaid_amount
FROM billing b
GROUP BY MONTH(b.bill_date), MONTHNAME(b.bill_date)
ORDER BY month_number ASC;


-- ============================================================
-- END OF PROJECT
-- Healthcare Patient Analytics
-- ============================================================
