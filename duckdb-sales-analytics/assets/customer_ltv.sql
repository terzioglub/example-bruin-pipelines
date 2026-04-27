/* @bruin

name: analytics.customer_ltv
type: duckdb.sql

materialization:
  type: table

depends:
  - analytics.customers
  - analytics.orders

columns:
  - name: customer_id
    type: INTEGER
    description: Unique identifier for the customer
    primary_key: true
  - name: customer_name
    type: VARCHAR
    description: Customer full name
  - name: region
    type: VARCHAR
    description: Primary sales region
  - name: acquisition_channel
    type: VARCHAR
    description: Marketing channel responsible for the first conversion
  - name: completed_orders
    type: INTEGER
    description: Completed order count
    checks:
      - name: non_negative
  - name: lifetime_value
    type: FLOAT
    description: Total completed-order net revenue
    checks:
      - name: non_negative
  - name: last_order_date
    type: DATE
    description: Most recent completed order date

@bruin */

SELECT
    c.customer_id,
    c.customer_name,
    c.region,
    c.acquisition_channel,
    COUNT(o.order_id) AS completed_orders,
    COALESCE(SUM(o.net_revenue), 0) AS lifetime_value,
    MAX(o.order_date) AS last_order_date
FROM analytics.customers AS c
LEFT JOIN analytics.orders AS o
    ON c.customer_id = o.customer_id
    AND o.order_status = 'completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.region,
    c.acquisition_channel
ORDER BY lifetime_value DESC, c.customer_id;
