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
