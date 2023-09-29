 /* А) какую сумму в среднем в месяц тратит:
		- пользователи в возрастном диапазоне от 18 до 25 лет включительно */
SELECT
    DATE_TRUNC('month', P.date) AS month,
    AVG(I.price) AS average_monthly_spending
FROM
    users U
JOIN
    purchases P ON U.userId = P.userId
JOIN
    items I ON P.itemId = I.itemId
WHERE
    U.age BETWEEN 18 AND 25
GROUP BY
    DATE_TRUNC('month', P.date)
ORDER BY
    month;