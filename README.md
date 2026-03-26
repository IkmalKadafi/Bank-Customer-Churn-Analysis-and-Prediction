# Bank Customer Churn Analysis & Prediction

Proyek ini bertujuan untuk memprediksi probabilitas nasabah yang akan berhenti (*churn*) dari sebuah **Bank di Vietnam**, serta memberikan *insights* dan rekomendasi bisnis untuk meminimalisasi kerugian finansial bank (terutama target mengamankan $115.4M total aset dan melacak $12.42M *Balance at Risk*).

**Tentang Dataset:**
- Seluruh nilai nominal uang di dalam proyek ini (termasuk saldo / *balance*) telah **dikonversi ke Dolar Amerika Serikat (USD)** guna menstandarkan interpretasi model analitik.
- Dataset mentah yang digunakan diambil dari platform publik Kaggle: [Vietnam Bank Churn Dataset 2025](https://www.kaggle.com/datasets/tranhuunhan/vietnam-bank-churn-dataset-2025).

Proyek analitik ini disusun ke dalam 8 (delapan) fase utama, mencakup persiapan *source data* hingga divisualisasikan melalui **Business Intelligence (Power BI)**.

## Alur Proyek (Project Phases)

Tabel berikut merupakan rangkuman seluruh tahapan dari awal hingga akhir proyek:

| Fase | Aktivitas Utama | Output / Result |
| :--- | :--- | :--- |
| **1. Business Understanding** | Identifikasi masalah *retention* nasabah dan potensi kerugian finansial. | Penentuan target: Mengamankan **$115.4M** total aset. |
| **2. Data Collection & Cleaning** | *Handling* 50.000 data mentah, pengecekan *missing values*, dan *outliers*. | Dataset bersih siap olah (50K baris data). |
| **3. Feature Engineering** | Pembuatan fitur *Financial Health Score* (avg: 0.00431) dan *Recency*. | Fitur baru yang terbukti meningkatkan daya prediksi model. |
| **4. Exploratory Data Analysis (EDA)** | Analisis distribusi *churn* dan identifikasi segmen dominan (Millennials: 45.64%). | *Initial insights* mengenai profil nasabah berisiko tinggi. |
| **5. Modeling & Tuning** | *Training* algoritma **Random Forest** & **XGBoost**, serta *Hyperparameter Tuning*. | Model terbaik yang dihasilkan mampunyai **Akurasi 82%**. |
| **6. Threshold Optimization** | Penyesuaian *probability threshold* ke angka 0.7 demi efisiensi bisnis. | Mendapatkan keseimbangan ideal antara *Precision* dan *Recall*. |
| **7. Business Intelligence (PowerBI)**| Integrasi hasil model ke *dashboard* interaktif dan analisis *Key Influencers*. | Visualisasi lengkap metrik kerugian bank (**$12.42M** *Balance at Risk*). |
| **8. Insight & Recommendation** | Identifikasi pemicu utama (Contoh: *Bronze Tier* = **23.14x risk**) serta penyusunan strategi aksi. | Rekomendasi strategi *retensi* nasabah yang sangat *data-driven*. |

---

## File Penting Lainnya
- `interpretasi_dashboard.md`: File ini memuat analisis yang komprehensif terkait temuan KPI, grafik demografi, dan wawasan yang kami dapatkan langsung dari tampilan Dashboard.
- `Dashboard.pdf`: Hasil rendering visual laporan interaktif.
- `.ipynb` dan file `.pkl`: Kode notebook eksperimen Machine Learning, skrip transformasi *Data Preparation*, dan model ekripsi akhir yang sudah dilatih (seperti model XGBoost & Random Forest).

---

## Teknologi & Tools yang Digunakan

Proyek ini merupakan implementasi *End-to-End Data Science*, di mana masing-masing bagian *pipeline* memanfaatkan *tools* yang berbeda sesuai fungsinya:

1. **MySQL**
   - Digunakan secara ekstensif pada tahap awal (*Data Understanding* & *Cleaning*). Terdapat file `.sql` (`data_cleaning.sql`, `create_table.sql`) yang menjalankan operasi penggabungan (*join*), penyaringan (*filtering*), dan standardisasi tabel di level *database* untuk memastikan integritas data.
   
2. **Python (Jupyter Notebook)**
   - Menjadi nyawa utama bagi pemrosesan algoritma (*Machine Learning Workflow*). Di dalam file `bank_customer_churn.ipynb`, Python (bersama pustaka **Pandas**, **Numpy**, **Scikit-Learn**, dan **XGBoost**) dimanfaatkan untuk:
     - Eksplorasi data mendalam (*Exploratory Data Analysis / EDA*).
     - *Feature Engineering* (menciptakan indikator *Financial Health Score* dsb).
     - Pelatihan model (*Training*), optimasi *Hyperparameter Tuning*, dan penentuan titik *Threshold* yang tepat.
   - Model beserta *scaler* kemudian diekspor menjadi format `.pkl` agar dapat langsung digunakan untuk prediksi di masa mendatang tanpa *training* ulang.

3. **Microsoft Power BI**
   - Berperan krusial sebagai jembatan antara teknis data analitik dan dunia bisnis. Power BI (`Dashboard.pbix`) digunakan untuk menerjemahkan matriks prediktif yang kompleks menjadi visualisasi interaktif yang mudah dipahami, memungkinkan jajaran eksekutif menganalisis *Key Influencers* (aktor penentu *churn*) dan menentukan taktik penyelamatan *Balance at Risk*.

---

## Penutup

Proyek ini mendemonstrasikan bagaimana kolaborasi ragam teknologi (*End-to-End Pipeline*)—mulai dari manipulasi data mentah dengan **MySQL**, pembuatan model prediktif berbasis *Machine Learning* yang kuat menggunakan **Python**, hingga presentasi visual yang interaktif melalui **Power BI**—mampu memberikan nilai bisnis yang nyata. Melalui pendekatan yang bertumpu pada data, bank diharapkan dapat bergerak dan mengambil strategi preventif (*proactive retention*) sebelum kerugian finansial akibat nasabah yang *churn* benar-benar terjadi.
