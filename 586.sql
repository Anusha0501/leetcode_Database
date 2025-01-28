#586. Customer Placing the Largest Number of Orders

SELECT customer_number FROM orders 
GROUP BY customer_number 
HAVING count(*)>=ALL(SELECT count(*) FROM orders GROUP BY customer_number);

