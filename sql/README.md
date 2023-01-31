# Introduction

# Content
1. [PvL](#physic-vs-logic-data-models)
2. [Transactions](#Transactions)
   2. [ACID](#acid)
3. [Definitions](#definitions)
4. [Normal forms](#normal-forms)
   1. [1НФ](#1nf)
   2. [2НФ](#2nf)
   3. [3НФ](#3nf)
      1. [НФ Бойса-Кодда](#nfbc)
   4. [4НФ](#4nf)
   5. [5НФ](#5nf)
   6. [6НФ](#6nf)
5. [Custom SQL's](#custom-sqls)
6. [Read-write ration]

## Physic vs Logic data models
Логическая модель данных является универсальной и 
никак не связана с конкретной реализацией СУБД. 
Физическая модель данных, напротив, зависит от конкретной СУБД

## Transactions
### ACID
[(RU) Habr](https://habr.com/en/post/317884/)  
A - Atomicity. Each transaction will be completed or rollback.  
C - Consistency. Completion of transaction cannot break data consistency.  
I - isolation. Transactions will be executed sequentially   
D - Durability. Data couldn't be broken after successful transaction  

## Definitions
- Attribute - column/field
- Domain - field type(int/string/etc)
- Relation schema - (define as R in literature)(set of schema attributes R defines as U)
- Relation - table
- Relation key - PK
  - Super-key - PK with attributes
- Database schema - (define as S in literature)
- Functional dependency - When X -> Y, for each cortege with different X different set of values Y
- Multivalued functional dependency - 

## Normal forms
The **objectives** are is to 
avoid update/insertion/deletion anomalies

Links:
- [Habr (RU)](https://habr.com/ru/post/254773/) - Нормализация отношений. Шесть нормальных форм
### 1NF
### 2NF
### 3NF
#### NFBC
### 4NF
### 5NF
### 6NF

## Custom SQL's
Each SQL database realization has its own unique SQL dialect.  
For example, PostgreSQL has PL/pgsql: [link](https://www.postgresql.org/docs/current/plpgsql.html)

## Read-write ration
- Standard is 75/25 (75% read, 25% write)
