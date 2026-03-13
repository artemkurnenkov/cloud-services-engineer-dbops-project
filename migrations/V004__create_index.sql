-- Индекс orders_status_date_idx
CREATE INDEX orders_status_date_index
    ON orders (status, date_created);

-- Индекс для order_product и orders
CREATE INDEX order_product_order_id_index
    ON order_product (order_id);
