# dbops-project

## Пререквизиты перед выполнением миграций

### Создаём базу `store`, в которой будут проходить миграции

```sql
CREATE DATABASE store;
```

### Создаем пользователя для выполнения миграций

```sql
CREATE USER flyway_user WITH PASSWORD 'password';
```

### Выдаем необходимые права на базу `store`

```sql
GRANT ALL PRIVILEGES ON DATABASE store TO flyway_user;
```

### Подключаемся к базе `store`

```sql
\c store
```

### Выдаем все права на схему `public`

```sql
GRANT USAGE, CREATE ON SCHEMA public TO flyway_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO flyway_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO flyway_user;
```

## Запрос для расчета количества проданных сосисок за предыдущую неделю

```sql
SELECT
    DATE(ord.date_created) AS order_date,
    SUM(ord_pr.quantity)
FROM orders AS ord
INNER JOIN order_product ord_pr
    ON ord.id = ord_pr.order_id
WHERE
    ord.status = 'shipped'
    AND ord.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY
    DATE(ord.date_created)
ORDER BY
    order_date DESC;
```

### Вывод запроса

```sql
    order_date DESC;
 order_date |  sum
------------+--------
 2026-03-13 | 143089
 2026-03-12 | 287996
 2026-03-11 | 292327
 2026-03-10 | 290534
 2026-03-09 | 286687
 2026-03-08 | 290409
 2026-03-07 | 289729
(7 rows)
```

### Запрос для анализа времени выполнения

```sql
EXPLAIN ANALYZE SELECT
    DATE(ord.date_created) AS order_date,
    SUM(ord_pr.quantity)
FROM orders AS ord
INNER JOIN order_product ord_pr
    ON ord.id = ord_pr.order_id
WHERE
    ord.status = 'shipped'
    AND ord.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY
    DATE(ord.date_created)
ORDER BY
    order_date DESC;
```

#### Вывод до использования индексов

```sql
Time: 197.722 ms
```
