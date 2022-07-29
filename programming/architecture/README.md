# Introduction
[(RU) Habr](https://habr.com/ru/post/459620/) - TDDx2, BDD, DDD, FDD, MDD & PDD
# Content
1. [DDD](#domain-driven-design) - Domain Driven Design
2. [TDD](#test-driven-design) - Test-Driven Design
3. [EDA](#event-driven-architecture) - Event-Driven Architecture
4. [Hexagonal architecture](#hexagonal-architecture)


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

# Event-Driven Architecture
- Kafka as event bus

# Hexagonal architecture
![image.png](hexagonal%20architecture.jpg)