/* Quiz: LEFT & RIGHT */
SELECT RIGHT(website, 3) AS web, COUNT(*) companies_count FROM accounts
GROUP BY web;

SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) companies_count FROM accounts
GROUP BY first_letter
ORDER BY first_letter;

SELECT SUM(number_name) num,SUM(letter_name) letter FROM (
SELECT name,
CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9')
THEN 1 ELSE 0 END AS number_name,
CASE WHEN LEFT(UPPER(name), 1) NOT IN ('0','1','2','3','4','5','6','7','8','9')
THEN 1 ELSE 0 END AS letter_name
FROM accounts)X;

SELECT SUM(vowels) vowels, SUM(other) other FROM
(SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
THEN 1 ELSE 0 END AS vowels,
CASE WHEN LEFT(UPPER(name), 1) IN ('A','E','I','O','U')
THEN 0 ELSE 1 END AS other
FROM accounts) X;

/* Quiz: POSITION, STRPOS */
SELECT LEFT(primary_poc, STRPOS(primary_poc,' ')) AS first,
RIGHT(primary_poc, LENGTH(primary_poc)-STRPOS(primary_poc,' ')) AS last
FROM accounts;

SELECT LEFT(name, STRPOS(name, ' ') -1 ) AS first,
RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) AS last
FROM sales_reps;

/* Quiz: CONCAT */
WITH t1 AS (
 SELECT LEFT(primary_poc,STRPOS(primary_poc, ' ') -1 ) first_name,
 RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name, name
 FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com') FROM t1;

WITH t1 AS (
SELECT LEFT(primary_poc,     STRPOS(primary_poc, ' ') -1 ) first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
name FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@',
REPLACE(name, ' ', ''), '.com') FROM  t1;

WITH t1 AS (
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ')-1 ) first_name,
RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) last_name,
name FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name, '@', name, '.com'),
LEFT(LOWER(first_name), 1) || RIGHT(LOWER(first_name), 1) || LEFT(LOWER(last_name), 1) ||
RIGHT(LOWER(last_name), 1) || LENGTH(first_name) || LENGTH(last_name) ||
REPLACE(UPPER(name), ' ', '') AS pwd
FROM t1;

/* Quiz: CAST */
SELECT * FROM sf_crime_data LIMIT 10;

SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' ||
SUBSTR(date, 4, 2)) date_val FROM sf_crime_data;

SELECT date orig_date, (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' ||
SUBSTR(date, 4, 2))::DATE date_val FROM sf_crime_data;

/* Quiz: COALESCE */
SELECT COALESCE(a.id, a.id) replace_null, a.name, a.website, a.lat, a.long,
a.primary_poc, a.sales_rep_id, o.* FROM accounts a
LEFT JOIN orders o ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long,
a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at,
o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd,
o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long,
a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id,
o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty,
COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty,
COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd,
COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd,
COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o ON a.id = o.account_id
WHERE o.total IS NULL;

SELECT COUNT(*) FROM accounts a
LEFT JOIN orders o ON a.id = o.account_id;

SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long,
a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id,
o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty,
COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty,
COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd,
COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd,
COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o ON a.id = o.account_id;