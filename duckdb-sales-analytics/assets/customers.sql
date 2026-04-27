/* @bruin

name: analytics.customers
type: duckdb.sql

materialization:
  type: table

columns:
  - name: customer_id
    type: INTEGER
    description: Unique identifier for the customer
    primary_key: true
    checks:
      - name: not_null
      - name: positive
  - name: customer_name
    type: VARCHAR
    description: Customer full name
    checks:
      - name: not_null
  - name: region
    type: VARCHAR
    description: Primary sales region
  - name: acquisition_channel
    type: VARCHAR
    description: Marketing channel responsible for the first conversion

@bruin */

SELECT
    1 AS customer_id,
    'Avery Johnson' AS customer_name,
    'North America' AS region,
    'Paid Search' AS acquisition_channel
UNION ALL
SELECT
    2 AS customer_id,
    'Priya Patel' AS customer_name,
    'Europe' AS region,
    'Organic Search' AS acquisition_channel
UNION ALL
SELECT
    3 AS customer_id,
    'Mateo Garcia' AS customer_name,
    'Latin America' AS region,
    'Partner Referral' AS acquisition_channel
UNION ALL
SELECT
    4 AS customer_id,
    'Lena Schmidt' AS customer_name,
    'Europe' AS region,
    'Email' AS acquisition_channel;
