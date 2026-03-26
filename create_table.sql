CREATE TABLE vietnam_bank (
    id INT PRIMARY KEY,
    full_name VARCHAR(255),
    credit_sco INT,
    gender VARCHAR(20),
    age INT,
    occupation VARCHAR(100),
    balance DECIMAL(20, 2),
    monthly_ir DECIMAL(20, 2),
    address VARCHAR(255),
    origin_province VARCHAR(100),
    tenure_ye INT,
    married TINYINT,
    nums_card INT,
    nums_service INT,
    active_member VARCHAR(10), -- Sekarang 'False' masuk ke sini (Aman)
    last_active_date VARCHAR(20), -- Gunakan VARCHAR dulu agar tidak error format tanggal
    last_transaction_month DECIMAL(20, 2), -- Sudah di posisi ke-17 yang benar
    created_date VARCHAR(20),
    `exit` VARCHAR(10), -- Gunakan backtick karena 'exit' adalah kata kunci SQL
    customer_segment VARCHAR(50),
    engagement_score FLOAT,
    loyalty_level VARCHAR(50),
    digital_behavior VARCHAR(50),
    risk_score FLOAT,
    risk_segment VARCHAR(50),
    cluster_group INT
);