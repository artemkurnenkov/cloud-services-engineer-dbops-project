-- Добавляем поле price в product и делаем поле id первичным ключом
ALTER TABLE product
    ADD COLUMN price double precision,
    ADD PRIMARY KEY (id);

-- Добавляем поле date_created в orders и делаем поле id первичным ключом
ALTER TABLE orders
    ADD COLUMN date_created date DEFAULT current_date,
    ADD PRIMARY KEY (id);

-- Устанавливаем внешние ключи с каскадным удалением
ALTER TABLE order_product
    ADD CONSTRAINT fk_order_product_order
        FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_order_product_product
        FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE;

-- Удаляем устаревшие таблицы, так как данные перенесены в другие таблицы в виде отдельных полей
DROP TABLE IF EXISTS orders_date;
DROP TABLE IF EXISTS product_info;
