# Marketing Campaign Performance Analysis

## Project Overview

This project focuses on analyzing **marketing campaign performance** to extract insights about **conversion rates, customer engagement, and ROI (Return on Investment)**. The analysis integrates **Python, SQL, and Power BI** to support data-driven decision-making for improving campaign effectiveness.

### Key Insights Covered:

- **Exploratory Data Analysis (EDA):** Understanding campaign performance across different dimensions
- **Customer Segmentation:** Using clustering techniques to identify customer groups
- **Statistical Testing:** Validating hypotheses about campaign effectiveness
- **Time-Series Forecasting:** Predicting future ROI trends
- **SQL Query Analysis:** Extracting key insights using complex SQL queries
- **Power BI Dashboards:** Visualizing the marketing performance effectively

---

## Technologies & Skills Used

- **Python (Pandas, NumPy, Matplotlib, Seaborn)** - Data cleaning, visualization, and analysis
- **Scikit-learn** - Clustering models (K-Means)
- **Statsmodels & SciPy** - Statistical testing (ANOVA, Chi-Square, T-tests)
- **Prophet & ARIMA** - Time-series forecasting
- **SQL** - Writing complex queries for campaign insights
- **Power BI** - Interactive dashboards & visual storytelling

---

## Dataset

- **Source:** [Marketing Campaign Performance Dataset](https://www.kaggle.com/datasets/manishabhatt22/marketing-campaign-performance-dataset)
- **Attributes Include:**
  - Campaign details (Company, Type, Target Audience, Channel Used)
  - Performance metrics (Clicks, Impressions, Engagement Score, Conversion Rate, ROI)
  - Cost-related data (Acquisition Cost, CPC, CTR)
  - Time-based features (Date, Duration in Days, Year-Month)

---

## Project Workflow

### Data Cleaning (`01-data-cleaning.ipynb`)

- Loaded **raw campaign data** from CSV
- Fixed incorrect data types (e.g., converting `Acquisition_Cost` from string to float)
- Created new calculated metrics:
  - **Engagement Ratio:** Clicks / Impressions
  - **Cost Per Click (CPC):** Acquisition Cost / Clicks
  - **Click-Through Rate (CTR):** Clicks / Impressions
- Saved the **cleaned dataset** for further analysis

### Exploratory Data Analysis (`02-exploratory-analysis.ipynb`)

- **Summary statistics & missing values analysis**
- **Bar charts & heatmaps** to visualize key trends
- Identified **top-performing channels & customer segments**
- Analyzed **ROI & conversion rates across campaign types**

### Statistical Testing (`03-statistical-tests.ipynb`)

- **ANOVA test:** Checked if ROI differs across marketing channels
- **Chi-Square test:** Examined if customer segments impact conversion rates
- **T-Test:** Compared engagement scores between Email vs. Social Media campaigns

### Customer Segmentation (`04-customer-segmentation.ipynb`)

- Applied **K-Means clustering** to group customers based on engagement & spending patterns
- Used **PCA (Principal Component Analysis)** for dimensionality reduction
- Evaluated **Silhouette Scores** to determine the optimal number of clusters
- Assigned each customer to a **data-driven customer segment**

### Time-Series Forecasting (`05-time-series-forecasting.ipynb`)

- Aggregated ROI **monthly** for trend analysis
- Built **ARIMA** & **Prophet** models to predict future ROI
- Compared forecast accuracy using **Mean Absolute Error (MAE)**

### SQL Query Analysis (`queries.sql`)

- **25+ SQL queries** to extract business insights:
  - Best-performing campaigns by ROI
  - Trends in customer engagement over time
  - High vs. low conversion campaigns
  - Cost efficiency per marketing channel
  - Monthly revenue trends

### Power BI Dashboard (`PowerBI_Analysis.pbix`)

- Created an interactive **dashboard** with:
  - **ROI Trends Over Time (Line Chart)**
  - **Conversion Rate by Customer Segment (Bar Chart)**
  - **Marketing Channel Performance (Stacked Bar Chart)**
  - **Clicks vs. Impressions Analysis (Scatter Plot)**
  - **Top 5 Companies by Campaign ROI (Table View)**

---

## Power BI Dashboard Highlights

| **Visualization**                             | **Purpose**                                  |
| --------------------------------------------- | -------------------------------------------- |
| **ROI Trends Over Time**                   | Identify seasonal patterns in ROI            |
| **Top-Selling Marketing Channels**         | See which channels perform best              |
| **Customer Segments vs. Conversion Rates** | Analyze which customer groups convert better |
| **Click-Through Rate vs. Cost per Click**  | Optimize campaign spending                   |
| **Campaign Performance by Location**       | Identify high-ROI regions                    |

---

## Folder Structure

```
Marketing-Campaign-Performance-Analysis/
│── dashboard/
│   ├── PowerBI_Analysis.pbix  # Power BI dashboard file
│
│── data/
│   ├── cleaned_campaign_data.zip  # Processed dataset
│   ├── customer_segments.zip  # Clustered customer data
│
│── notebooks/
│   ├── 01-data-cleaning.ipynb  # Data cleaning & preprocessing
│   ├── 02-exploratory-analysis.ipynb  # EDA & data visualization
│   ├── 03-statistical-tests.ipynb  # Statistical hypothesis testing
│   ├── 04-customer-segmentation.ipynb  # Clustering & segmentation
│   ├── 05-time-series-forecasting.ipynb  # ROI prediction
│
│── sql_queries/
│   ├── queries.sql  # SQL queries for data insights
│   ├── query_outputs/  # Folder containing SQL query results
│
│── README.md  # Project documentation
```

---

## How to Use This Project

### Run Python Code

1. Install dependencies:
   ```bash
   pip install pandas numpy matplotlib seaborn scikit-learn statsmodels prophet
   ```
2. Open and run the **Jupyter Notebooks** (`.ipynb` files) step by step.

### Execute SQL Queries

- Load `cleaned_campaign_data.csv` into **SQL Server / PostgreSQL**
- Run `queries.sql` to generate **insights** on campaign performance

### View Power BI Dashboard

- Open `PowerBI_Analysis.pbix` in **Power BI Desktop**
- Interact with visualizations to explore campaign performance

---

## Contact

 **Tanzim Rafat**  
 Email: [tanzimrafat069@gmail.com](mailto:tanzimrafat069@gmail.com)  
 LinkedIn: [Tanzim Rafat](https://www.linkedin.com/in/tanzimrafat/)

---