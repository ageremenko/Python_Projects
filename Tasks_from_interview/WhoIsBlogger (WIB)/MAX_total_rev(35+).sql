/* Б) в каком месяце года выручка от пользователей в возрастном диапазоне 35+ самая большая */
SELECT
    DATE_TRUNC('month', P.date) AS month,
    SUM(I.price) AS total_revenue
FROM
    users U
JOIN
    purchases P ON U.userId = P.userId
JOIN
    items I ON P.itemId = I.itemId
WHERE
    U.age > 35
GROUP BY
    DATE_TRUNC('month', P.date)
ORDER BY
    total_revenue DESC
LIMIT 1;