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
