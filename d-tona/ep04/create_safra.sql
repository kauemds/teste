/*Visualizando os clientes que realizaram venda nos próximos 3 meses após a base estudada*/

SELECT
    t1.*
,   case when t2.seller_id is not null then 1 else 0 end as flag_model
FROM
    tb_book_sellers as t1
LEFT JOIN
    (
    SELECT DISTINCT t2.seller_id
    FROM tb_orders t1
    LEFT JOIN tb_order_items t2 ON t1.order_id = t2.order_id
    WHERE t1.order_approved_at BETWEEN '2017-04-01' AND '2017-07-01'
    AND order_status = 'delivered'
    ) as t2
ON t1.seller_id = t2.seller_id
ORDER BY flag_model
