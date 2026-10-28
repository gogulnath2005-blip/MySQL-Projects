-- ============================================================
-- Project: MySQL SQL Practice
-- File: 02_customer_order_analysis.sql
-- Purpose: Practice LEFT JOIN, COUNT, SUM, AVG, MIN, MAX,
--          GROUP BY, HAVING, and readable column aliases.
-- Database: newquery
--
-- IMPORTANT:
-- This script assumes:
--   customer(c_id, c_name)
--   order2(o_id, c_id, o_price)
-- Adjust names if your database schema differs.
-- ============================================================

USE newquery;

-- 1. View all customers
SELECT *
FROM customer;

-- 2. Count orders placed by each customer
SELECT
    c.c_id,
    c.c_name AS customer_name,
    COUNT(o.o_id) AS total_orders
FROM customer AS c
LEFT JOIN order2 AS o
    ON c.c_id = o.c_id
GROUP BY
    c.c_id,
    c.c_name
ORDER BY
    total_orders DESC,
    customer_name ASC;

-- 3. Calculate total spending for each customer
SELECT
    c.c_id,
    c.c_name AS customer_name,
    COALESCE(SUM(o.o_price), 0) AS total_spending
FROM customer AS c
LEFT JOIN order2 AS o
    ON c.c_id = o.c_id
GROUP BY
    c.c_id,
    c.c_name
ORDER BY
    total_spending DESC,
    customer_name ASC;

-- 4. Summarize order amount statistics for each customer
SELECT
    c.c_id,
    c.c_name AS customer_name,
    COUNT(o.o_id) AS total_orders,
    COALESCE(SUM(o.o_price), 0) AS total_spending,
    ROUND(AVG(o.o_price), 2) AS average_order_amount,
    MAX(o.o_price) AS highest_order_amount,
    MIN(o.o_price) AS lowest_order_amount
FROM customer AS c
LEFT JOIN order2 AS o
    ON c.c_id = o.c_id
GROUP BY
    c.c_id,
    c.c_name
ORDER BY
    total_spending DESC;

-- 5. Customers whose total spending exceeds 50,000
SELECT
    c.c_id,
    c.c_name AS customer_name,
    COUNT(o.o_id) AS total_orders,
    SUM(o.o_price) AS total_spending
FROM customer AS c
LEFT JOIN order2 AS o
    ON c.c_id = o.c_id
GROUP BY
    c.c_id,
    c.c_name
HAVING SUM(o.o_price) > 50000
ORDER BY
    total_spending DESC;
