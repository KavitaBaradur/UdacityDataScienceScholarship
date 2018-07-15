/* Quiz: SUM */
SELECT SUM(poster_qty) FROM orders;

SELECT SUM(standard_qty) FROM orders;

SELECT SUM(total_amt_usd) FROM orders;

SELECT standard_amt_usd+gloss_amt_usd TOTAL_AMT FROM orders;

SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS PER_UNIT_PRICE FROM orders;

/* Quiz: MIN, MAX & AVG */
SELECT MIN(occurred_at) FROM orders;

SELECT occurred_at FROM orders
ORDER BY occurred_at ASC LIMIT 1;

SELECT MAX(occurred_at) FROM web_events;

SELECT occurred_at FROM web_events
ORDER BY occurred_at DESC LIMIT 1;

SELECT AVG(standard_qty) AVG_STD_QTY,
AVG(gloss_qty) AVG_GLOSS_QTY,
AVG(poster_qty) AVG_POSTER_QTY,
AVG(standard_amt_usd) AVG_STD_AMT,
AVG(gloss_amt_usd) AVG_GLOSS_AMT,
AVG(poster_amt_usd) AVG_POSTER_AMT
FROM orders;

SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS X
ORDER BY total_amt_usd DESC
LIMIT 2;

/* Quiz: GROUP BY */
SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o ON a.id = o.account_id
ORDER BY occurred_at LIMIT 1;

SELECT a.name, SUM(o.total_amt_usd) SALES
FROM orders o
JOIN accounts a ON a.id = o.account_id
GROUP BY a.name;

SELECT a.name, w.occurred_at, w.channel
FROM web_events w
JOIN accounts a ON a.id = w.account_id
ORDER BY w.occurred_at LIMIT 1;

SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel;

SELECT a.primary_poc
FROM web_events w
JOIN accounts a ON a.id = w.account_id
ORDER BY w.occurred_at LIMIT 1;

SELECT a.name, MIN(total_amt_usd) TOTAL_USD
FROM accounts a
JOIN orders o on a.id=o.account_id
GROUP BY a.name
ORDER BY TOTAL_USD;

SELECT r.name, COUNT(*) REPS
FROM region r
JOIN sales_reps s ON r.id = s.region_id
GROUP BY r.name ORDER BY REPS;

/* Quiz: GROUP BY Part 2*/
SELECT a.name, AVG(o.standard_qty) AVG_STD_QTY,
AVG(o.gloss_qty) AVG_GLOSS_QTY,
AVG(o.poster_qty) AVG_POSTER_QTY
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY a.name;

SELECT a.name, AVG(o.standard_amt_usd) AVG_STD_AMT,
AVG(o.gloss_amt_usd) AVG_GLOSS_AMT,
AVG(o.poster_amt_usd) AVG_POSTER_AMT
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY a.name;

SELECT s.name, w.channel, COUNT(*) EVENTS
FROM accounts a
JOIN web_events w ON a.id = w.account_id
JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY EVENTS DESC;

SELECT r.name, w.channel, COUNT(*) EVENTS
FROM accounts a
JOIN web_events w ON a.id = w.account_id
JOIN sales_reps s ON s.id = a.sales_rep_id
JOIN region r ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY EVENTS DESC;

/* Quiz: DISTINCT */
SELECT a.id a_id, r.id r_id,
a.name a_name, r.name r_name
FROM accounts a
JOIN sales_reps s ON s.id = a.sales_rep_id
JOIN region r ON r.id = s.region_id;

SELECT DISTINCT a.name, a.id FROM accounts a;

SELECT s.id, s.name, COUNT(*) ACTS
FROM accounts a
JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY ACTS;

SELECT DISTINCT s.name, s.id FROM sales_reps s;

/* Quiz: HAVING */
SELECT s.id, s.name, COUNT(*) TOTAL_ACCOUNTS
FROM accounts a
JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY TOTAL_ACCOUNTS;

SELECT a.id, a.name, COUNT(*) TOTAL_ORDERS
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20 ORDER BY TOTAL_ORDERS;

SELECT a.id, a.name, COUNT(*) TOTAL_ORDERS
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY TOTAL_ORDERS DESC LIMIT 1;

SELECT a.id, a.name, SUM(o.total_amt_usd) TOTAL
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY TOTAL;

SELECT a.id, a.name, SUM(o.total_amt_usd) TOTAL
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY TOTAL;

SELECT a.id, a.name, SUM(o.total_amt_usd) TOTAL
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY TOTAL DESC LIMIT 1;

SELECT a.id, a.name, SUM(o.total_amt_usd) TOTAL
FROM accounts a
JOIN orders o ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY TOTAL ASC LIMIT 1;

SELECT a.id, a.name, w.channel, COUNT(*) CHANNEL_CNT
FROM accounts a
JOIN web_events w ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY CHANNEL_CNT;

SELECT a.id, a.name, w.channel, COUNT(*) CHANNEL_CNT
FROM accounts a
JOIN web_events w ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY CHANNEL_CNT DESC LIMIT 1;

SELECT a.id, a.name, w.channel, COUNT(*) CHANNEL_CNT
FROM accounts a
JOIN web_events w ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY CHANNEL_CNT DESC LIMIT 10;

/* Quiz: DATE */
SELECT DATE_PART('year', occurred_at) order_year,  SUM(total_amt_usd) TOTAL
FROM orders GROUP BY order_year
ORDER BY TOTAL DESC;

SELECT DATE_PART('month', occurred_at) ORDER_MONTH, SUM(total_amt_usd) TOTAL
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY ORDER_MONTH
ORDER BY TOTAL DESC;

SELECT DATE_PART('year', occurred_at) ORDER_YEAR, COUNT(*) TOTAL
FROM orders
GROUP BY ORDER_YEAR
ORDER BY TOTAL DESC;

SELECT DATE_PART('month', occurred_at) ORDER_MONTH, COUNT(*) TOTAL
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY ORDER_MONTH
ORDER BY TOTAL DESC;

SELECT DATE_TRUNC('month', o.occurred_at) ORDER_DATE, SUM(o.gloss_amt_usd) TOTAL
FROM orders o
JOIN accounts a ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY ORDER_DATE
ORDER BY TOTAL DESC
LIMIT 1;

/* Quiz: CASE */
SELECT a.name, SUM(total_amt_usd) TOTAL,
     CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
     WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
     ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a ON o.account_id = a.id
GROUP BY a.name ORDER BY TOTAL DESC;

SELECT a.name, SUM(total_amt_usd) TOTAL,
     CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
     WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
     ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a ON o.account_id = a.id
WHERE occurred_at > '2015-12-31'
GROUP BY a.name
ORDER BY TOTAL DESC;

SELECT s.name, COUNT(*) TOTAL_ORDERS,
     CASE WHEN COUNT(*) > 200 THEN 'top'
     ELSE 'not' END AS sales_rep_level
FROM orders o
JOIN accounts a ON o.account_id = a.id
JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY s.name
ORDER BY TOTAL_ORDERS DESC;

SELECT s.name, COUNT(*), SUM(o.total_amt_usd) TOTAL,
     CASE WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
     WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
     ELSE 'low' END AS sales_rep_level
FROM orders o
JOIN accounts a ON o.account_id = a.id
JOIN sales_reps s ON s.id = a.sales_rep_id
GROUP BY s.name ORDER BY TOTAL DESC;