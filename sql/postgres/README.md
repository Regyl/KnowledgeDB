# Introduction

# Content
1. [Transactions](#Transactions)
   1. [Phenomena](#Phenomena)
2. [Indexes](#Indexes),
   1. [B-Tree](#b-tree)
   2. [Hash](#hash)
   3. [GiST](#gist)
   4. [SP-GiST](#sp-gist)
   5. [BRIN](#brin)

# Transactions
[Documentation](https://www.postgresql.org/docs/current/transaction-iso.html)
[(RU) Habr](https://habr.com/en/post/317884/)
Transaction levels:
- Read uncommitted
- Read committed (*default*)
- Repeatable read
- Serializable
## Phenomena
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

# Indexes
- [Documentation](https://www.postgresql.org/docs/current/indexes.html)
- [(RU) Habr](https://habr.com/en/company/postgrespro/blog/326096/)

## B-Tree
B-trees can handle equality and range queries on data that can 
be sorted into some ordering. 
In particular, the PostgreSQL **query planner will consider** 
using a B-tree index whenever 
an indexed column is involved in a comparison using one of 
these operators:
- <
- <=
- =
- \>= 
- \>
## Hash
Hash indexes store a 32-bit hash code derived from the value of 
the indexed column. Hence, such indexes can only handle simple 
equality comparisons.   
**The query** planner will consider using a hash 
index whenever an indexed column is involved in a comparison using 
the equal operator: *=*
## GiST
GiST = generalized search tree  
Like [B-Tree](#b-tree), but using custom comparator to compare specific data,
e.g. images, geo-data, text
## SP-GiST
SP-GiST - space partitioning generalized search tree

[//]: # (FIXME add info)
## GIN
GIN - generalized inverted index  

[//]: # (FIXME add info)
## BRIN
BRIN - block range index
[//]: # (FIXME add info)


## Linked themes
1. [Docker](https://github.com/Regyl/KnowledgeDB/tree/master/virtual/docker)
