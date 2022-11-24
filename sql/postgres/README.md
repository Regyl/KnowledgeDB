# Introduction

# Content
1. [Transactions](#Transactions)
   1. [Phenomena](#Phenomena)

## Transactions
[Documentation](https://www.postgresql.org/docs/current/transaction-iso.html)
[(RU) Habr](https://habr.com/en/post/317884/)
Transaction levels:
- Read uncommitted
- Read committed (*default*)
- Repeatable read
- Serializable
### Phenomena
**Dirty read**  
A transaction reads data written
by a concurrent uncommitted transaction.

**Non-repeatable read**  
A transaction re-reads data it has previously
read and finds that data has been modified by another
transaction (that committed since the initial read).

**Phantom read**  
A transaction re-executes a query returning a set of rows
that satisfy a search condition and finds that the set of rows
satisfying the condition has changed due to another recently-committed
transaction.

**Serialization anomaly**  
The result of successfully committing a group of transactions
is inconsistent with all possible orderings of running those
transactions one at a time.
![phenomena.png](phenomena.png)




###### Create schema & user
1. CREATE SCHEMA IF NOT EXISTS [schema];
2. CREATE USER [username] WITH PASSWORD '[password]';
3. GRANT CONNECT ON DATABASE [database] TO [username];
4. GRANT ALL PRIVILEGES ON SCHEMA [schema] TO [username];


## Linked themes
1. [Docker](https://github.com/Regyl/KnowledgeDB/tree/master/virtual/docker)
