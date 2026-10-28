# MySQL SQL Project

## Topics covered

### Employee salary analysis
- `SELECT`, `WHERE`, and `IN` / `NOT IN`
- Scalar subqueries
- Aggregate functions: `AVG`, `MAX`, `MIN`, `SUM`, and `COUNT`
- `GROUP BY` and `HAVING`
- Department-level and city-level analysis

### Customer and order analysis
- `LEFT JOIN`
- `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`
- `COALESCE` for customers with no orders
- Clear output aliases such as `total_orders` and `total_spending`
- `GROUP BY`, `HAVING`, and `ORDER BY`

## Repository structure

```text
mysql-sql-practice/
├── 01_employee_salary_analysis.sql
├── 02_customer_order_analysis.sql
└── README.md
```

## Requirements

- MySQL Server
- MySQL Workbench (or another MySQL client)
- A database named `newquery`
- Tables and columns matching the assumptions documented at the top of each SQL file

## How to run

1. Open MySQL Workbench and connect to your MySQL server.
2. Open one of the `.sql` files.
3. Confirm that the database and table names match your schema.
4. Execute the queries individually or run the script section by section.
5. Review the result grid and compare the output with the comment above each query.

## Schema assumptions

The scripts are based on the names used in the original practice file:

- Employee table: `emp` with `name`, `dept`, `salary`, `age`, and `city`
- Customer table: `customer` with `c_id` and `c_name`
- Order table: `order2` with `o_id`, `c_id`, and `o_price`

The original file used both `emp` and `employess`. The formatted version standardizes employee queries on `emp`; change the name if your actual table is different.

## Notes

- These scripts are query practice files, not a complete database setup. They do not create tables or insert sample data.
- The scripts preserve the original query themes while improving formatting, aliases, comments, and one malformed city subquery.
- Verify table and column names against your own database before running.
- Add sample schema/data and screenshots of query results to make the GitHub repository stronger.
