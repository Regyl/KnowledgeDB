# Introduction

# Content

\timing on

## Updates

Heap-only tuples are used to optimize *update* queries.
To obtain this optimization automatically query should not touch indexed columns.
- [Heap-only tuples](https://www.postgresql.org/docs/15/storage-hot.html)

To see how frequently it used you need a column pg_stat_all_tables.n_tup_hot_upd
- [HOT updates quantity](https://www.postgresql.org/docs/15/monitoring-stats.html#MONITORING-PG-STAT-ALL-TABLES-VIEW:~:text=of%20rows%20deleted-,n_tup_hot_upd,-bigint)