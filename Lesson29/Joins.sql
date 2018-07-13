select accounts.* ,orders.* from accounts
join orders ON orders.account_id = accounts.id;

select orders.standard_qty, orders.gloss_qty, orders.poster_qty,
accounts.website, accounts.primary_poc from accounts
join orders ON orders.account_id = accounts.id;

/* 11. Join Part 1 */
SELECT a.primary_poc,w.occurred_at,w.channel
FROM web_events w
JOIN accounts a on w.account_id=a.id
AND a.name='Walmart';

SELECT r.name AS r_name, s.name AS s_name, a.name AS a_name
FROM region r
JOIN sales_reps s ON r.id=s.region_id
JOIN accounts a ON s.id = a.sales_rep_id
ORDER BY a.name;

SELECT r.name AS r_name, a.name AS a_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region r
JOIN sales_reps s ON r.id=s.region_id
JOIN accounts a ON s.id=a.sales_rep_id
JOIN orders o ON a.id = o.account_id;

/* 19. Last Check */
SELECT r.name AS r_name, s.name AS s_name, a.name AS a_name
FROM region r
JOIN sales_reps s ON r.id=s.region_id
JOIN accounts a ON s.id = a.sales_rep_id
WHERE r.name='Midwest'
ORDER BY a.name;

SELECT r.name AS r_name, s.name AS s_name, a.name AS a_name
FROM region r
JOIN sales_reps s ON r.id=s.region_id
JOIN accounts a ON s.id = a.sales_rep_id
WHERE r.name='Midwest' and s.name LIKE 'S%'
ORDER BY a.name;

SELECT r.name AS r_name, s.name AS s_name, a.name AS a_name
FROM region r
JOIN sales_reps s ON r.id=s.region_id
JOIN accounts a ON s.id = a.sales_rep_id
WHERE r.name='Midwest' and s.name LIKE '% K%'
ORDER BY a.name;

SELECT r.name AS r_name, a.name AS a_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region r
JOIN sales_reps s ON r.id=s.region_id
JOIN accounts a ON s.id=a.sales_rep_id
JOIN orders o ON a.id = o.account_id
WHERE o.standard_qty>100;

SELECT r.name AS r_name, a.name AS a_name, o.total_amt_usd/(o.total+0.01) AS unit_price
FROM region r
JOIN sales_reps s ON r.id=s.region_id
JOIN accounts a ON s.id=a.sales_rep_id
JOIN orders o ON a.id = o.account_id
WHERE o.standard_qty>100 and o.poster_qty>50;

SELECT distinct a.name, w.channel
FROM accounts a
JOIN web_events w ON a.id=w.account_id
WHERE a.id=1001;

SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM orders o
JOIN accounts a ON a.id=o.account_id
WHERE o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01';