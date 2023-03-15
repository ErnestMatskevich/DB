explain analyze
SELECT
  store_id,
  city_id,
  MAX(profit) AS max_profit
FROM
  (SELECT
     stores_profit.store_id,
     city_id,
     profit 
   FROM 
   (SELECT
      store_id,
      city_id
    FROM store
    INNER JOIN address
    ON store.address_id = address.address_id) AS stores_with_city
   INNER JOIN
  (SELECT
     SUM(amount) AS profit,
     store_id 
   FROM
     (SELECT
     rental.rental_id,
     payment_date,
     last_update,
     amount,
     rental_date,
     inventory_id
     FROM payment
     INNER JOIN rental 
     ON rental.rental_id = payment.rental_id
     WHERE payment_date BETWEEN '2007-05-01' AND '2007-05-31') AS records_of_last_month
   INNER JOIN inventory ON inventory.inventory_id = records_of_last_month.inventory_id 
   GROUP BY store_id) AS stores_profit
ON stores_with_city.store_id = stores_profit.store_id) AS stores_with_profit_and_city
GROUP BY store_id, city_id;