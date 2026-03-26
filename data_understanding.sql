-- 1. Cek Total Data & Uniqueness
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT id) AS unique_ids
FROM vietnam_bank;

-- 2. Cek Missing Values
SELECT
    SUM(CASE WHEN monthly_ir IS NULL THEN 1 ELSE 0 END) as null_income,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) as null_balance,
    SUM(CASE WHEN `exit` IS NULL THEN 1 ELSE 0 END) as null_exit,
    SUM(CASE WHEN last_active_date IS NULL OR last_active_date = '0000-00-00' THEN 1 ELSE 0 END) as null_dates
FROM vietnam_bank;

-- 3. Statistik Deskriptif Dasar
SELECT
    MIN(age) as min_age, MAX(age) as max_age, AVG(age) as avg_age,
    MIN(balance) as min_bal, MAX(balance) as max_bal, AVG(balance) as avg_bal,
    MIN(monthly_ir) as min_income, MAX(monthly_ir) as max_income, AVG(monthly_ir) as avg_income,
    MIN(credit_sco) as min_credit, MAX(credit_sco) as max_credit, AVG(credit_sco) as avg_credit
FROM vietnam_bank;

-- Cek Outlier Data
SELECT 
    'Age' as fitur, MIN(age) as min, MAX(age) as max, AVG(age) as avg, STDDEV(age) as stddev FROM vietnam_bank
UNION ALL
    SELECT 'Balance', MIN(balance), MAX(balance), AVG(balance), STDDEV(balance) FROM vietnam_bank
UNION ALL
    SELECT 'Monthly Income', MIN(monthly_ir), MAX(monthly_ir), AVG(monthly_ir), STDDEV(monthly_ir) FROM vietnam_bank
UNION ALL
    SELECT 'Credit Score', MIN(credit_sco), MAX(credit_sco), AVG(credit_sco), STDDEV(credit_sco) FROM vietnam_bank;

-- Anomaly Check
SELECT customer_segment, COUNT(*) as jumlah_pencilan, AVG(balance) as avg_pencilan
FROM vietnam_bank
WHERE balance > (SELECT AVG(balance) + (2 * STDDEV(balance)) FROM vietnam_bank)
GROUP BY customer_segment;

-- 4. Cek apakah ada anomali skor tinggi pada nasabah churn
SELECT count(*) FROM vietnam_bank WHERE `exit` = '1' AND engagement_score > 90;

-- Lihat Detail Nasabah dengan Skor Tinggi tapi Churn
SELECT id, full_name, engagement_score, `exit`, last_active_date 
FROM vietnam_bank 
WHERE `exit` = '1' AND engagement_score > 90;


-- 5. Distribusi Kategori
SELECT `exit`, COUNT(*) as total_exit,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM vietnam_bank), 2) as percentage
FROM vietnam_bank
GROUP BY `exit`;

-- Melihat Sebaran berdasarkan Segment
SELECT customer_segment, risk_segment, COUNT(*) as total_segment
FROM vietnam_bank
GROUP BY customer_segment, risk_segment
ORDER BY customer_segment;