/*B. Practical:
Create an Online Shopping Management System using Customer and Orders tables.
1. Create both tables with suitable attributes and apply Primary Key and Foreign Key constraints.
2. Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
3. Insert at least 5 customer records and 5 order records.
4. Display orders whose total amount is greater than ₹5,000.
5. Calculate the total order amount for each customer using GROUP BY and SUM().
6. Display customers whose total order amount exceeds ₹10,000 using HAVING.
7. Find the average order amount using AVG().
8. Update the status of a particular order.
9. Delete an order based on a suitable condition.
10. Add a new column to the Orders table using ALTER.
11. Display the final order records.*/
CREATE DATABASE management;
USE management;
CREATE TABLE customers(
customer_name VARCHAR(40) NOT NULL,
customer_id INT PRIMARY KEY,
email VARCHAR(30) UNIQUE,
city VARCHAR(20)
);
CREATE TABLE orders (
 order_id INT PRIMARY KEY NOT NULL,
 customer_id  INT   NOT NULL,
 order_date DATE NOT NULL,
 total_amount DECIMAL(10,2) CHECK(total_amount>0),
 status VARCHAR(15) DEFAULT("PENDING"),
 FOREIGN KEY(customer_id)
 REFERENCES
 customers(customer_id)
 );
 INSERT INTO customers
 VALUES
 ("KIRAN",1,"abc@gmail.com","VARANASI"),
 ("SHOBAN",2,"xyz@gmail.com","MUMBAI"),
 ("GAUTAMI",3,"hey@gamil.com","MUMBAI"),
 ("KISHORE",4,"max@gmail.com","HYDERABAD"),
 ("ABHI",5,"fun@gmail.com","DELHI");
 
 INSERT INTO orders
 VALUES
(101, 1, '2026-10-01', 6500, 'Pending'),
(102, 1, '2026-10-02', 5000, 'Shipped'),
(103, 2, '2026-10-03', 7500, 'Delivered'),
(104, 2, '2026-10-04', 4000, 'Pending'),
(105, 3, '2026-10-05', 12000, 'Shipped'),
(106, 4, '2026-10-06', 3000, 'Pending'),
(107, 5, '2026-10-07', 8500, 'Delivered');
 SELECT * FROM orders
 WHERE total_amount>5000;
 
 SELECT c.customer_id,c.customer_id,
   SUM(o.total_amount) AS TOTAL
   FROM customers c
   JOIN
   orders o
   ON c.customer_id=o.customer_id
   GROUP BY SUM(o.total_amount);

   SELECT c.customer_id ,c.customer_name
   FROM customers c
   JOIN
   orders o
   ON c.customer_id=o.customer_id
   WHERE o.total_amount>10000;
   
   SELECT AVG(total_amount) AS average_amount
   FROM orders;
   
   UPDATE  orders
   SET status="delievered"
   WHERE order_id=102;
   
   DELETE  FROM orders
   WHERE total_amount<4000;
   
   ALTER TABLE orders
   ADD delieved_date DATE;
   
   SELECT* FROM orders;