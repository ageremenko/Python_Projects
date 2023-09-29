/* Г) топ-3 товаров по выручке и их доля в общей выручке за любой год */
WITH RevenueByItem AS (
    SELECT
        DATE_TRUNC('year', P.date) AS year,
        P.itemId,
        SUM(I.price) AS total_revenue
    FROM
        Purchases P
    JOIN
        Items I ON P.itemId = I.itemId
    GROUP BY
        year, P.itemId
),
TopItemsByYear AS (
    SELECT
        year,
        itemId,
        total_revenue,
        ROW_NUMBER() OVER (PARTITION BY year ORDER BY total_revenue DESC) AS item_rank
    FROM
        RevenueByItem
)
SELECT
    year,
    itemId,
    total_revenue,
    (total_revenue / SUM(total_revenue) OVER (PARTITION BY year)) AS revenue_share
FROM
    TopItemsByYear
WHERE
    item_rank <= 3;