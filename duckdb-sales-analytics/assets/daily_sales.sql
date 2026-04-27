/* @bruin

name: analytics.daily_sales
type: duckdb.sql

materialization:
  type: table

depends:
  - analytics.orders

columns:
  - name: order_date
    type: DATE
    description: Date bucket for the revenue summary
  - name: completed_orders
    type: INTEGER
    description: Count of completed orders
    checks:
      - name: non_negative
  - name: total_net_revenue
    type: FLOAT
    description: Net revenue for completed orders
    checks:
      - name: non_negative
  - name: average_order_value
    type: FLOAT
    description: Average net revenue per completed order
    checks:
      - name: non_negative

@bruin */

SELECT
    order_date,
    COUNT(*) AS completed_orders,
    SUM(net_revenue) AS total_net_revenue,
    ROUND(AVG(net_revenue), 2) AS average_order_value
FROM analytics.orders
WHERE order_status = 'completed'
GROUP BY order_date
ORDER BY order_date;
