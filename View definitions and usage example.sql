USE ecommerce_db;

-- --------------------------------------------------
-- 1️.Using CREATE VIEW with a Complex SELECT Query
-- --------------------------------------------------
-- This view shows each customer's total orders, total payment, and average order value.
CREATE VIEW customer_sales_summary AS
SELECT 
    c.Customer_ID,
    c.Name AS Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(p.Amount) AS Total_Payment,
    AVG(p.Amount) AS Average_Order_Value
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Payment p ON o.Order_ID = p.Order_ID
GROUP BY c.Customer_ID, c.Name;

-- View helps to easily see overall customer sales stats 
-- without writing the full join and aggregate query every time.

-- --------------------------------------------------
-- 2️. Using Views for Abstraction and Security
-- --------------------------------------------------
-- Suppose we don’t want all team members to see customer phone numbers or emails.
-- We create a "secure" view that hides sensitive columns.

CREATE VIEW customer_public_view AS
SELECT 
    Customer_ID,
    Name,
    Address
FROM Customer;

-- This view can be given to customer support team or interns
-- They can query basic info without accessing private data.
-- ----------------------------------------------------------------------------
-- Create two sample users (for example)
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'intern_user'@'localhost' IDENTIFIED BY 'intern123';

-- Give full access to admin_user
GRANT ALL PRIVILEGES ON ecommerce_db.* TO 'admin_user'@'localhost';
GRANT SELECT ON ecommerce_db.Customer TO 'intern_user'@'localhost';

-- Restrict intern_user
-- Take away all access to the Customer table
REVOKE ALL PRIVILEGES ON Customer FROM 'intern_user'@'localhost';

-- Give access only to the safe view
GRANT SELECT ON customer_public_view TO 'intern_user'@'localhost';
-- --------------------------------------------------
-- 4. Example Usage of Views
-- --------------------------------------------------
-- Get all customer summaries
SELECT * FROM customer_sales_summary;

-- View only non-sensitive customer data
SELECT * FROM customer_public_view;

-- --------------------------------------------------
-- 5. Drop Views (Cleanup)
-- --------------------------------------------------
DROP VIEW IF EXISTS customer_sales_summary;
DROP VIEW IF EXISTS customer_public_view;
