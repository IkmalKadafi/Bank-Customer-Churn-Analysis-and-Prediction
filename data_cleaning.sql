-- 1. Standarisasi Nilai Boolean (Boolean Conversion)
-- Mengubah kolom target (exit) dan member aktif
UPDATE vietnam_bank
SET `exit` = CASE WHEN `exit` IN ('True', '1') THEN 1 ELSE 0 END,
    active_member = CASE WHEN active_member IN ('True', '1') THEN 1 ELSE 0 END;

-- Mengubah tipe kolom menjadi TINYINT agar lebih efisien di database
ALTER TABLE vietnam_bank
MODIFY COLUMN `exit` TINYINT,
MODIFY COLUMN active_member TINYINT;

-- 2. Normalisasi Tanggal (Date Standardization)
-- Pastikan format STR_TO_DATE sesuai dengan isi CSV ('%d/%m/%Y')
UPDATE vietnam_bank
SET last_active_date = STR_TO_DATE(last_active_date, '%d/%m/%Y'),
    created_date = STR_TO_DATE(created_date, '%d/%m/%Y');

-- Ubah tipe data kolom secara permanen
ALTER TABLE vietnam_bank
MODIFY COLUMN last_active_date DATE,
MODIFY COLUMN created_date DATE;

-- 3. Penanganan Nilai Null (Null Handling)
-- Mengisi NULL pada monthly_ir dengan rata-rata pendapatan
UPDATE vietnam_bank
SET monthly_ir = (SELECT AVG(monthly_ir) FROM (SELECT monthly_ir FROM vietnam_bank) AS temp)
WHERE monthly_ir IS NULL OR monthly_ir = 0;

-- Mengisi NULL pada kolom engagement_score dengan nilai default 0
UPDATE vietnam_bank
SET engagement_score = 0
WHERE engagement_score IS NULL;

-- 4. Menghapus Data Duplikat (Duplicate Removal)
-- Membuat index pada kolom kriteria duplikat
CREATE INDEX idx_duplicate_check ON vietnam_bank (full_name(50), address(50));

-- Menghapus duplikat berdasarkan full_name dan address, menyimpan yang pertama (id terkecil);
DELETE t1 FROM vietnam_bank t1
INNER JOIN vietnam_bank t2 
WHERE t1.id > t2.id
    AND t1.full_name = t2.full_name
    AND t1.address = t2.address;

-- Hapus Index agar tidak membebani database
DROP INDEX idx_duplicate_check ON vietnam_bank;

-- 5. Konsistensi Kategori (Category Consistency)
-- Menghapus spasi ekstra dan menyamakan format
UPDATE vietnam_bank
SET customer_segment = TRIM(customer_segment),
    risk_segment = TRIM(risk_segment),
    occupation = TRIM(occupation);

-- 6. Menghapus Anomali
DELETE FROM vietnam_bank 
WHERE `exit` = '1' AND engagement_score > 90;

-- 7. Pembuatan View
CREATE OR REPLACE VIEW v_churn_analytics AS
SELECT
    -- Identitas & Demografi
    id,
    age,
    gender,
    occupation,
    customer_segment,
    loyalty_level,

    -- Inovasi 4.4: Feature Engineering untuk business insight
    -- menghitung Balance to Income Ratio
    ROUND(balance / NULLIF(monthly_ir, 0), 4) AS balance_income_ratio,
    -- menghitung Tenure-to-Age Ratio untuk melihat loyalitas relatif terhadap usia
    ROUND(tenure_ye / NULLIF(age, 0), 4) AS tenure_age_ratio,

    -- Inovasi 4.1 & 4.2: Risk & Behavioral-Based Insight
    risk_score,
    risk_segment,
    engagement_score,
    nums_service,
    digital_behavior,

    -- Inovasi 4.3: Recency Analysis (Time-based Behavior)
    -- menghitung selisih hari dari tanggal aktif terakhir (Early Warning)
    DATEDIFF('2025-07-02', last_active_date) AS recency_days,

    -- Data Finansial & Target Variabel
    credit_sco AS credit_score,
    balance,
    monthly_ir AS monthly_income,
    active_member,
    -- memastikan kolom exit sudah dalam format 0/1 untuk analisis churn
    CAST(`exit` AS UNSIGNED) AS is_churn

FROM vietnam_bank;

SELECT is_churn, COUNT(*) FROM v_churn_analytics GROUP BY is_churn;