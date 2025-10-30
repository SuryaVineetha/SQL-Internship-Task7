🧩 Task 7 – Creating Views in SQL

🎯 Objective

The aim of this task was to learn how to create and use SQL Views for:

Simplifying complex queries (abstraction)

Securing data by controlling what users can access (security)

🧠 What I Did

Used the database ecommerce_db for this task.

Created a view using a complex SELECT query that combines multiple tables (Customer, Orders, Payment) to show each customer’s total orders, total payment, and average order value.

This helped simplify long join and aggregate queries into a single reusable view.

Created another secure view that hides private customer details such as phone number and email.

This view only shows basic information like customer ID, name, and address.

It is useful when sharing data with limited-access users (like interns or support teams).

Added example user creation and privilege commands:

Created two users: admin_user and intern_user.

Gave full access to admin_user.

Restricted the intern_user so they can see data only through the secure view.

Demonstrated how to use GRANT and REVOKE commands to control access permissions on tables and views.

Queried both views to check the results and finally used DROP VIEW to remove them after testing.

📘 Key Learnings

Views are used to simplify complex SQL queries and to hide unnecessary or sensitive data.

Data abstraction means showing only the needed information to users.

Data security can be managed using views along with GRANT and REVOKE permissions.

Multiple users can have different access levels to the same database using these methods.

🧰 Tools Used

MySQL Workbench

📄 Files Included

 View definitions and usage example – SQL code for creating and using views

README.md – Explanation of what was done in the task
