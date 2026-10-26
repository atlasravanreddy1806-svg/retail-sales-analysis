# Retail Sales Analysis using MySQL

## Overview
A beginner-to-intermediate SQL portfolio project using 20 illustrative retail sales records. It explores data quality, revenue and profit, product/category/city performance, monthly trends, customer spending segments, and SQL window functions.

## Business Questions
- What are total revenue, cost, profit, and profit margin?
- Which cities generate the most revenue?
- Which products and categories generate the most profit?
- How does revenue change month over month?
- Which customers place repeat orders, and how are customers segmented by spending?
- How can products be ranked within each category?

## Tools
- MySQL 8.0+ and MySQL Workbench
- SQL aggregation, `CASE`, CTEs, date functions, `LAG()`, `RANK()`, `ROW_NUMBER()`, `DENSE_RANK()`

## Dataset
The 20 records are synthetic examples created for learning, not real company or customer data. Each row represents one order line, and each sample order ID appears once.

## Setup
1. Run `sql/01_create_database.sql` in MySQL Workbench.
2. Run `sql/02_insert_sample_data.sql` once on the empty table.
3. Run `sql/03_data_quality_checks.sql`.
4. Run `sql/04_sales_analysis.sql` and `sql/05_advanced_analysis.sql`.

**Warning:** Re-running the insert script adds the same sample records again unless the table is reset first.

## Formulas
- Revenue = `quantity * unit_price`
- Cost = `quantity * unit_cost`
- Profit = `quantity * (unit_price - unit_cost)`
- Profit margin (%) = `profit / revenue * 100`

## Findings
Record only findings verified against your local database in `results/analysis_findings.md`. Because the dataset is small and synthetic, do not treat it as representative of a real retail business.

## Project Structure
```text
retail-sales-analysis/
├── README.md
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_insert_sample_data.sql
│   ├── 03_data_quality_checks.sql
│   ├── 04_sales_analysis.sql
│   └── 05_advanced_analysis.sql
└── results/
    └── analysis_findings.md
```

## Limitations and Next Steps
- Small synthetic dataset; insights are for SQL practice only.
- A production-quality version should use separate customer, product, order, and order-item tables, plus explicit order-line identifiers and return/refund handling.
- Future improvements: analyze a larger public dataset and add a Power BI dashboard.


