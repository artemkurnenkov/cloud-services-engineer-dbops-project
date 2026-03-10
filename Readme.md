# dbops-project

## Пререквизиты перед выполнением миграций

### Создаём базу `store`, в которой будут проходить миграции

```sql
CREATE DATABASE store;
```

### Создаем пользователя для выполнения миграций

```sql
CREATE USER flyway_user WITH PASSWORD '<password>';
```

### Выдаем необходимые права на базу `store`

```sql
GRANT ALL PRIVILEGES ON DATABASE store TO flyway_user;
```
