# Introduction

# Content
1. [Definitions](#definitions)
2. [Normal forms](#normal-forms)
   1. [1НФ](#1nf)
   2. [2НФ](#2nf)
   3. [3НФ](#3nf)
      1. [НФ Бойса-Кодда](#nfbc)
   4. [4НФ](#4nf)
   5. [5НФ](#5nf)
   6. [6НФ](#6nf)
   7. [Algorithms](#algorithms)
      1. [Фэджина](#ronald-fagin)
      2. [Делобеля-Кейси](#delobel-casey)
      3. [Бернштейна](#ethan-bernstein)

## Definitions
- Attribute - column/field
- Domain - field type(int/string/etc)
- Relation schema - (define as R in literature)(set of schema attributes R defines as U)
- Relation - table
- Relation key - PK
  - Superkey - PK with attributes
- Database schema - (define as S in literature)
- Functional dependency - When X -> Y, for each cortege with different X different set of values Y
- Multivalued functional dependency - 

## Normal forms

The **objectives** are is to 
avoid update/insertion/deletion anomalies

### 1NF

### 2NF

### 3NF

#### NFBC
***Нормальная форма Бойса-Кодда (НФБК)***

### 4NF

### 5NF

### 6NF

### Algorithms
If you're from RUT MIIT - [u could text me](http://t.me/corgidile)  
**Определения:**
- FK - foreign key, внешний ключ. [Wikipedia says](https://ru.wikipedia.org/wiki/%D0%A4%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D0%BE%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D0%B0%D1%8F_%D0%B7%D0%B0%D0%B2%D0%B8%D1%81%D0%B8%D0%BC%D0%BE%D1%81%D1%82%D1%8C_(%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)) it's analog of relationship OneToMany.
- PK - primary key, первичный ключ 
- FD - functional dependency, функциональная зависимость


Для начала выпишем дано:  
Стоит отметить, что таблицы-результаты отношения ManyToMany не используются в принципе.  
Нужно выписать S0 = {R0 =<(
*абсоютно все аттрибуты(т.е. поля/столбцы), 
исключая таблицы many-to-many полностью и FK*),
{*все функциональные зависимости PK->атрибуты таблицы исключая PK, 
и PK->FK отдельно для каждого FK*}>}
#### Ronald Fagin
Алгоритм Фэджина - это итеративный алгоритм. 
- Lead relations to [4NF](#4nf)  

Концептуально выглядит следующим образом:  
На каждой итерации из общего набора полей выдергивается часть 
(основываясь на FD) и выделяется в отдельную таблицу. 
Когда перебраны все FD, основанные на PK -> остальные поля таблицы,
переходим к FD, основанным на отношениях OneToMany/ManyToOne(PK -> FK).  
В результате записываем Sd = {R1<(), {}>...Ri<(), {}>}, причем число R = число итераций+1.

#### Delobel-Casey
Алгоритм Делобеля-Кейси
- Lead relations to [3NF](#3nf)

Концептуально выглядит следующим образом:  
1. Выписываем все PK
2. Ищем неизбыточный(т.е. одна FD не должна включать в себя другую) набор FD. К тому набору значений, что есть в дано, добавляются зависимости ManyToMany в виде НАЗВАНИЕ_ТАБЛИЦЫ -> <поля таблицы>
3. Собираем Sd по кусочкам. Число отношений(таблиц) равно числу FD, т.к. собираются они максимально просто - R=<(атрибуты+PK из п.2){FD из п.2}>. Конец.
#### Ethan Bernstein
Алгоритм Бернштейна
- Lead relations to [3NF](#3nf)

1. Все FD, которые получились как результаты OneToMany/ManyToOne сливаем с основной таблицей. Получим PK -> <все атрибуты>+FK
### Links
1. [(RU) Habr](https://habr.com/ru/post/254773/) - Нормализация отношений. Шесть нормальных форм
