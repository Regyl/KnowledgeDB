# Introduction

# Content
- [DateTime API](#datetime-api)
- [Futile cycles](#futile-cycles)

# DateTime API
- [(RU) Habr](https://habr.com/ru/post/274811/) - DateTimeAPI

# Futile cycles
- [(RU) Habr](https://habr.com/ru/post/674116/) - Futile cycles

# JMH
- [(RU) Habr](https://habr.com/ru/post/349914/) - Java Microbenchmark Harness

# Stream API
```java
Stream.flatMap(Function<? super T,? extends Stream<? extends R>> mapper))
```
flatMap возвращает по стриму для каждого объекта в первоначальном 
стриме, а затем результирующие потоки объединяются в исходный стрим.

- [(RU) Habr](https://habr.com/ru/company/luxoft/blog/270383/)