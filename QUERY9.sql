-- Group the orders by date and calculate the average number of pizzas ordered per day
SELECT 
    round(avg(quantity),0)
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        order_details
    JOIN orders ON order_details.order_id = orders.order_id
    GROUP BY orders.order_date) AS order_quantity;