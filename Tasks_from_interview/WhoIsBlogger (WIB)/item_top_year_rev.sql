/* В) какой товар обеспечивает дает наибольший вклад в выручку за последний год */
SELECT
    P.itemId,
    SUM(I.price) AS total_revenue
FROM
    Purchases P
JOIN
    Items I ON P.itemId = I.itemId
WHERE
    DATE_TRUNC('year', P.date) = DATE_TRUNC('year', (SELECT Max(PP.date) FROM Purchases PP))
GROUP BY
    P.itemId
ORDER BY
    total_revenue DESC
LIMIT 1;