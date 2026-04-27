/* @bruin

name: analytics.orders
type: duckdb.sql

materialization:
  type: table

columns:
  - name: order_id
    type: INTEGER
    description: Unique identifier for each order
    primary_key: true
    checks:
      - name: not_null
      - name: positive
  - name: customer_id
    type: INTEGER
    description: Foreign key to the customer placing the order
    checks:
      - name: not_null
      - name: positive
  - name: order_date
    type: DATE
    description: Date the order was placed
  - name: gross_revenue
    type: FLOAT
    description: Revenue before discounts
    checks:
      - name: positive
  - name: discount_amount
    type: FLOAT
    description: Promotional discount applied to the order
    checks:
      - name: non_negative
  - name: net_revenue
    type: FLOAT
    description: Revenue recognized after discounts
    checks:
      - name: positive
  - name: order_status
    type: VARCHAR
    description: Order lifecycle status

@bruin */

SELECT
    1001 AS order_id,
    1 AS customer_id,
    DATE '2024-01-10' AS order_date,
    240.00 AS gross_revenue,
    20.00 AS discount_amount,
    220.00 AS net_revenue,
    'completed' AS order_status
UNION ALL
SELECT
    1002 AS order_id,
    2 AS customer_id,
    DATE '2024-01-10' AS order_date,
    120.00 AS gross_revenue,
    0.00 AS discount_amount,
    120.00 AS net_revenue,
    'completed' AS order_status
UNION ALL
SELECT
    1003 AS order_id,
    1 AS customer_id,
    DATE '2024-01-11' AS order_date,
    90.00 AS gross_revenue,
    10.00 AS discount_amount,
    80.00 AS net_revenue,
    'completed' AS order_status
UNION ALL
SELECT
    1004 AS order_id,
    3 AS customer_id,
    DATE '2024-01-11' AS order_date,
    310.00 AS gross_revenue,
    30.00 AS discount_amount,
    280.00 AS net_revenue,
    'completed' AS order_status
UNION ALL
SELECT
    1005 AS order_id,
    4 AS customer_id,
    DATE '2024-01-12' AS order_date,
    160.00 AS gross_revenue,
    0.00 AS discount_amount,
    160.00 AS net_revenue,
    'completed' AS order_status
UNION ALL
SELECT
    1006 AS order_id,
    2 AS customer_id,
    DATE '2024-01-12' AS order_date,
    75.00 AS gross_revenue,
    5.00 AS discount_amount,
    70.00 AS net_revenue,
    'returned' AS order_status;
