CREATE DATABASE HEALTHCARE_ANALYTICS;
USE HEALTHCARE_ANALYTICS;

-- 1. How many total patients are registered in the hospital?--
SELECT 
    *
FROM
    PATIENTS;
SELECT 
    COUNT(PATIENT_ID)
FROM
    PATIENTS;


-- 2. What is the gender-wise distribution of patients?--
SELECT 
    GENDER, COUNT(GENDER) AS GENDER_WISE_DISTRIBUTION
FROM
    PATIENTS
GROUP BY GENDER; 


-- 3. How many doctors are available in each specialization?--
SELECT 
    *
FROM
    DOCTORS;
SELECT 
    SPECIALIZATION, COUNT(DOCTOR_ID)
FROM
    DOCTORS
GROUP BY SPECIALIZATION;


-- 4. What is the total number of appointments recorded?--
SELECT 
    *
FROM
    APPOINTMENTS;
SELECT 
    COUNT(APPOINTMENT_ID)
FROM
    APPOINTMENTS;


-- 5. What is the total revenue generated from billing?--
SELECT 
    *
FROM
    BILLING;
SELECT 
    SUM(AMOUNT)
FROM
    BILLING;


-- 6. Which doctors have handled the highest number of appointments?--
SELECT 
    DOCTORS.DOCTOR_ID,
    CONCAT(DOCTORS.FIRST_NAME,
            ' ',
            DOCTORS.LAST_NAME) AS DOCTOR_NAME,
    COUNT(APPOINTMENTS.APPOINTMENT_ID) AS TOTAL_APPOINTMRNTS
FROM
    DOCTORS
        JOIN
    APPOINTMENTS ON DOCTORS.DOCTOR_ID = APPOINTMENTS.DOCTOR_ID
GROUP BY DOCTORS.DOCTOR_ID , DOCTORS.FIRST_NAME , DOCTORS.LAST_NAME
ORDER BY TOTAL_APPOINTMRNTS DESC;

-- 7. Which specialization has the highest number of patient visits?--
SELECT 
    DOCTORS.SPECIALIZATION,
    COUNT(APPOINTMENTS.APPOINTMENT_ID) AS TOTAL_PATIENT_VISITS
FROM
    DOCTORS
        JOIN
    APPOINTMENTS ON DOCTORS.DOCTOR_ID = APPOINTMENTS.DOCTOR_ID
GROUP BY DOCTORS.SPECIALIZATION
ORDER BY TOTAL_PATIENT_VISITS DESC;


-- 8. What is the monthly trend of patient appointments?--
SELECT 
    *
FROM
    APPOINTMENTS;
SELECT 
    MONTHNAME(APPOINTMENT_DATE) AS APPOINTMENT_MONTH,
    COUNT(APPOINTMENT_ID) AS TOTAL_APPOINTMENTS
FROM
    APPOINTMENTS
GROUP BY MONTHNAME(APPOINTMENT_DATE) , MONTH(APPOINTMENT_DATE)
ORDER BY MONTH(APPOINTMENT_DATE);


-- 9. What are the most frequently performed treatments?--
SELECT 
    *
FROM
    TREATMENTS;
SELECT 
    TREATMENT_TYPE, COUNT(TREATMENT_TYPE)
FROM
    TREATMENTS
GROUP BY TREATMENT_TYPE
ORDER BY TREATMENT_TYPE DESC;


-- 10. What is the average treatment cost for each treatment type?--
SELECT 
    TREATMENT_TYPE, AVG(COST) AS AVERAGE_TREATMENT_COST
FROM
    TREATMENTS
GROUP BY TREATMENT_TYPE;


-- 11. Rank doctors based on the total revenue generated--
WITH DoctorRevenue AS
(
    SELECT
        d.doctor_id,
        CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
        SUM(t.cost) AS total_revenue
    FROM doctors d
    JOIN appointments a
        ON d.doctor_id = a.doctor_id
    JOIN treatments t
        ON a.appointment_id = t.appointment_id
    GROUP BY
        d.doctor_id,
        d.first_name,
        d.last_name
)

SELECT
    doctor_id,
    doctor_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS doctor_rank
FROM DoctorRevenue;


-- 12. Find patients who have visited the hospital more than 3 times--
SELECT* FROM PATIENTS;
SELECT 
PATIENT_ID,
CONCAT(FIRST_NAME, " ", LAST_NAME) AS PATIENT_NAME,
COUNT(APPOINTMENT_ID) AS TOTAL_VISITS
FROM PATIENTS
GROUP BY PATIENT_ID, FIRST_NAME, LAST_NAME
HAVING COUNT(APPOINTMENT_ID) > 3;

SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    COUNT(a.appointment_id) AS total_visits
FROM patients p
JOIN appointments a
    ON p.patient_id = a.patient_id
GROUP BY
    p.patient_id,
    p.first_name,
    p.last_name
HAVING COUNT(a.appointment_id) > 3;


-- 13. Find doctors whose appointment count is higher than the average doctor appointment count.--
WITH DoctorAppointments AS
(
    SELECT
        d.doctor_id,
        CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
        COUNT(a.appointment_id) AS appointment_count
    FROM doctors d
    JOIN appointments a
        ON d.doctor_id = a.doctor_id
    GROUP BY
        d.doctor_id,
        d.first_name,
        d.last_name
)

SELECT
    doctor_id,
    doctor_name,
    appointment_count
FROM DoctorAppointments
WHERE appointment_count >
(
    SELECT AVG(appointment_count)
    FROM DoctorAppointments
)
ORDER BY appointment_count DESC;


-- 14. Calculate the month-over-month revenue growth rate.--
WITH MonthlyRevenue AS
(
    SELECT
        YEAR(bill_date) AS year,
        MONTH(bill_date) AS month,
        SUM(amount) AS total_revenue
    FROM billing
    GROUP BY
        YEAR(bill_date),
        MONTH(bill_date)
)

SELECT
    year,
    month,
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY year, month) AS previous_month_revenue,
    ROUND(
        (
            (total_revenue - LAG(total_revenue) OVER (ORDER BY year, month))
            /
            LAG(total_revenue) OVER (ORDER BY year, month)
        ) * 100,
        2
    ) AS revenue_growth_percentage
FROM MonthlyRevenue;
