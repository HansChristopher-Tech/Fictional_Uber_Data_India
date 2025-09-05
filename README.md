
# 🚖 Uber Data From India

## 📂 Dataset
[Uber Ride Analytics Dashboard – Kaggle](https://www.kaggle.com/datasets/yashdevladdha/uber-ride-analytics-dashboard)

## 📌 Overview
This project analyzes Uber ride booking data using **PostgreSQL** for SQL queries and **Excel** for visualizations.  
The goal is to extract insights on **customer behavior, driver performance, revenue trends, and cancellations**.

## 🛠️ Tools Used
- 🐘 **PostgreSQL** – Data storage & SQL queries  
- 📊 **Excel 2016** – Pivot tables & visualizations  
- 🌐 **GitHub** – Documentation & version control  

---

# 📊 Example Analysis & Insights Using Querries from PostgreSQL

## 1️⃣ Business Overview
**Code:**
```sql
WITH ride_metrics AS (
    SELECT
        COUNT(*) AS total_rides,
        COUNT(*) FILTER (WHERE booking_status = 'Completed') AS completed_rides,
        COUNT(*) FILTER (WHERE cancelled_by_customer = true OR cancelled_by_driver = true) AS cancelled_rides,
        COUNT(*) FILTER (WHERE incomplete_rides = true) AS incomplete_rides
    FROM india_riders
)
SELECT * FROM ride_metrics;
````

**Output(1 Row):**

| ride_date  | ride_time | booking_id   | booking_status   |
|------------|-----------|--------------|------------------|
| 2024-03-23 | 12:29:38  | CNR5884300   | No Driver Found  |


**Insight:**
Most rides were completed at (\~62%) and it had a cancellation rate of (\~25%).

---

## 2️⃣ Customer Behavior

**Code:**

```sql
SELECT 
    customer_id,
    SUM(booking_value) AS total_spent
FROM india_riders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
```

**Output(First 3 Rows):**

| customer\_id | total\_spent |
| ------------ | ------------ |
| CUST102      | 4987         |
| CUST099      | 4722         |
| CUST201      | 4277         |

**Insight:**
A few loyal customers contribute significantly to revenue — potential for targeted loyalty programs.

---


# 📈 Visualizations (Excel)

📊 Example chart of **hourly ride distribution** (saved as PNG/JPEG).
[![Hourly Ride Distribution](Charts/Hour-Cancellations-trend.jpg)](Charts/Hour-Cancellations-trend.jpg)
---

# ✅ Key Takeaways

* High completion rate but cancellations remain an area of concern.
* Top customers drive revenue → loyalty opportunities.
* Vehicle type impacts ratings → sedan rides outperform others.
* Payment methods and ride times strongly affect customer experience.

---



