# Content
1. [DI](#dependency-injection-di)
    1. [IoC](#inversion-of-control-ioc)
2. [Memoization](#memoization)
3. [Acronym](#acronym)
   1. [SOLID](#solid)
   2. [DRY](#dont-repeat-yourself) - Don't Repeat Yourself
   3. [KISS](#keep-it-simple-stupid) - Keep It Simple Stupid
   4. [YAGNI](#you-arent-gonna-need-it) - You Aren't Gonna Need It
4. [DDD](#domain-driven-design) - Domain Driven Design

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

# Acronym
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

