# Content
1. [DI](#dependency-injection-di)
    1. [IoC](#inversion-of-control-ioc)
2. [Memoization](#memoization)
3. Acronym
   1. [SOLID](#solid)
   2. [DRY](#dont-repeat-yourself) - Don't Repeat Yourself
   3. [KISS](#keep-it-simple-stupid) - Keep It Simple Stupid
   4. [YAGNI](#you-arent-gonna-need-it) - You Aren't Gonna Need It
4. [DDD](#domain-driven-design) - Domain Driven Design
5. [TDD](#test-driven-design) - Test-Driven Design

# Dependency Injection (DI)

## Inversion of Control (IoC)

# Memoization
Мемоизация — вариант кеширования, 
заключающийся в том, что для функции создаётся таблица результатов,
и будучи вычисленной при определённых значениях параметров результат 
заносится в эту таблицу. В дальнейшем результат берётся из данной 
таблицы. Эта техника позволяет засчёт использования дополнительной 
памяти ускорить работу программы.
1. [(RU) Habr](https://habr.com/en/post/97513/)

## SOLID
In software engineering, SOLID is a mnemonic acronym 
for five design principles intended to make software designs 
more understandable, flexible, and maintainable.
## Single Responsibility Principle
Каждый класс ответственен за одну задачу и инкапсулирует свою часть.
## Open-closed Principle
Класс должен быть открыт для дополнения и закрыт для изменения.
## Liskov Substitution Principle
При подстановке вместо класса-наследника класса-родителя 
поведение программы не должно изменяться.
Therefore in methods (at least in Java) we can:
- Expand access modifier
- *Narrow* return type  

What we couldn't:
- Change even order of method parameters
- Expand return type
## Interface Segregation Principle
Лучше много интерфейсов с узкой специализацией, чем один общий.
## Dependency Inversion Principle
Зависеть от абстракции, а не от реализации.
```java
class Example {
   Map<String, Object> map = new HashMap<>(); //It's good
   
   HashMap<String, Object> map = new HashMap<>(); //It's bad!
}
```
## Don't Repeat Yourself
## Keep It Simple Stupid
## You Aren't Gonna Need It
# Domain Driven Design
Это про написание кода, основываясь на предметной области заказчика. 
При правильном использовании позволяет максимально облегчить бизнес-логику,
уменьшить связанность классов. Стоит рассматривать, когда use-case'ов более 15.

Фишка DDD - ***bounded context***. Это явная граница, внутри которой 
существует модель предметной области. Именно на основании контекстов 
можно разделить код на модули/пакеты/компоненты таким образом, чтобы
изменения в каждом из них оказывали минимальное влияние на других.

***Links:***
- [(RU) Habr](https://habr.com/ru/company/dododev/blog/489352/) - basic knowledge
- [GitHub](https://github.com/heynickc/awesome-ddd) - complete resource collection
- [(RU) Habr](https://habr.com/ru/company/dododev/blog/523540/) - example
- Books:
  - [Green book.pdf](VaughnVernonDDDDistilledRU.pdf)
  - [Green book eng.pdf](VaughnVernonDDDDistilledEng.pdf) - eng is better

# Test-Driven Design
Test-driven development (TDD) is a software development process relying 
on software requirements being converted to test cases before software 
is fully developed.