name: new.products2025
type: duckdb.sql
materialization:
    type: table
columns:
    - name: product_id
      type: INTEGER
      description: Unique identifier for the product
      primary_key: true
    - name: product_name
      type: VARCHAR
      description: Name of the product
    - name: price
      type: FLOAT
      description: Price of the product in USD
      checks:
        - name: positive
    - name: stock
      type: INTEGER
      description: Number of units in stock
