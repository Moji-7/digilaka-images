DELIMITER //
CREATE PROCEDURE populate_orders_products_categories_info (
  IN item_category2 NVARCHAR (110),
  IN item_category3 NVARCHAR (110) 
)
BEGIN
SELECT
    JSON_EXTRACT(order_item, '$.product.data_layer.item_category2') item_category2,
    JSON_EXTRACT(order_item, '$.product.data_layer.item_category3')  item_category3,
    COUNT(discount_percent) AS count,
    MAX(order_item->>'$.price.selling_price') AS max_price,
    ROUND(AVG(order_item->>'$.price.selling_price'),2) AS avg_price,
    SUM(order_item->>'$.price.selling_price') AS total_price,
    ROUND(AVG(discount_percent),2) AS avg_discount
FROM orders,
    JSON_TABLE (
        order_content, '$.order_item[*]'
        COLUMNS (
            order_item JSON PATH '$',
            discount_percent DECIMAL (10,2) PATH '$.price.discount_percent',
            selling_price DECIMAL (10,2) PATH '$.price.selling_price'
        )
    ) AS jt
WHERE
    (item_category2 IS NULL OR JSON_UNQUOTE(JSON_EXTRACT(order_item, '$.product.data_layer.item_category2')) LIKE CONCAT('%', item_category2, '%'))
    AND
    (item_category3 IS NULL OR JSON_UNQUOTE(JSON_EXTRACT(order_item, '$.product.data_layer.item_category3')) = item_category3)
GROUP BY item_category2, item_category3, order_item;

END //
DELIMITER ;

UPDATE orders
SET order_content = JSON_SET(order_content, '$.order_item[0].product.data_layer.item_category2', 'Electronics', '$.order_item[0].product.data_layer.item_category3', 'Laptops')
WHERE order_id = 207253579;

UPDATE orders
SET order_content = JSON_SET(order_content, '$.order_item[1].product.data_layer.item_category2', 'Electronics', '$.order_item[1].product.data_layer.item_category3', 'mobile')
WHERE order_id = 207253579;


UPDATE orders
SET order_content = JSON_SET(order_content, '$.order_item[1].product.data_layer.item_category2', 'Electronics', '$.order_item[1].product.data_layer.item_category3', 'mobile')
WHERE order_id = 208577414;