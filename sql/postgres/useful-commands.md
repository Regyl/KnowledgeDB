```
-- Active connections
SELECT (clock_timestamp() - xact_start) AS ts_age,
state, pid, query FROM pg_stat_activity
WHERE query ilike '%autovacuum%' AND NOT pid=pg_backend_pid()
```

```
-- Table sizes
SELECT relname AS name, relfilenode AS oid, (relpages * 8192 / (1024*1024))::int as size_mb, reltuples as count
FROM pg_class
WHERE relname NOT LIKE 'pg%'
ORDER BY relpages DESC;
```

```
-- Create index concurrently  
create index concurrently order_date_btree on order_entity using btree (order_date);
```