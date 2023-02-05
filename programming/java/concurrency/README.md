# Introduction

# Content
1. [1. Basics](#1-basics)
   1. [Keyword synchronized](#11-synchronized)
   2. [Keyword volatile](#12-volatile)
   3. [Visibility](#visibility)
2. [2. Java high-level concurrency API](#2-java-high-level-concurrency-api)
   1. [2.1 Data structures](#21-data-structures)
      1. [ConcurrentHashMap](#211-concurrenthashmap)
      2. [Synchronized vs Concurrent](#212-synchronized-vs-concurrent)
   2. [2.2 Locks](#22-locks)
      1. [ReentrantLock](#221-reentrantlock)
      2. [ReentrantReadWriteLock](#222-reentrantreadwritelock)
      3. [StampedLock](#223-stampedlock)
      4. [Phaser](#224-phaser)
   3. [2.3 Semaphore](#23-semaphore)
   4. [2.4 Unsafe](#24-unsafe)
   5. [ForkJoinPool](#forkjoinpool)
   6. [ExecutorService](#executorservice)
      1. [When and what to use](#when-and-what-to-use)
   7. [Future](#future)
   8. [RecursiveAction vs RecursiveTask](#recursiveaction-vs-recursivetask)
3. [Courses](#courses)
   1. [Parallel Programming in Java](#parallel-programming-in-java)
4. [Performance](#performance)
5. [Issues](#issues)
6. [Debug](#debug)
7. [Beware](#beware)
8. [Links](#links)

## 1. Basics
- Visibility -
- Stale data e.g. you have two variables, and thread will read the newest value 
of the second and old value of the first.
- Atomicity - safety for concurrent execution (e.g. AtomicInteger.compareAndSet)

**Publication**  
How to do safely:
- Initialization through static block
- Store reference to the object in volatile field/AtomicReference
- Store reference to the object in final field
- Store reference to the object in field that is properly guarded by a lock

### 1.1 synchronized
- It's also not cached (reading will produce the latest value)
When used in method signature, locks by the object instance.
#### 1.1.1 Monitor
In case of code below:
```java
public class Monitor {
    
    public static synchronized void someStaticMethod() {
        // ...
    }
    
    public synchronized void someMethod() {
        // ...
    }
}
```
- `someStaticMethod` will be locked by `Monitor.class`
- `someMethod` will be locked by `this` (instance of `Monitor`)

### 1.2 volatile
- It's not cached (reading will produce the latest value)
- It's not reordered
- **Not like synchronized**, because it doesn't provide atomicity.
- Usually used for flags

---

## 2. Java high-level concurrency API
### 2.1 Data structures
[Related to](../collections/README.md)
#### 2.1.1 ConcurrentHashMap
- Synchronized on the first element in the bucket (for write)
#### 2.1.2 Synchronized vs Concurrent
### 2.2 Locks
#### 2.2.1 ReentrantLock
#### 2.2.2. ReentrantReadWriteLock
#### 2.2.3 StampedLock
#### 2.2.4 Phaser
Зачем по факту разделение на arrive/wait в алгоритме из ДЗ

Types of usage:
- Just a barrier
- Point-to-point synchronization
- Split phase/fuzzy barriers
### 2.3 Semaphore
### 2.4 Unsafe
_Let's brake the rules._  
Main useful things:
- The fastest CPU's feature compareAndSet
- Directly access CPU and other hardware features 
- Create an object but not run its constructor
- Create a truly anonymous class without the usual verification
- Manually manage off-heap memory 
- Do many other seemingly impossible things
### ForkJoinPool
> A ForkJoinPool differs from other kinds of ExecutorService mainly by virtue of employing work-stealing: 
> all threads in the pool attempt to find and execute tasks submitted to the pool and/or created by other active tasks

There is a static method _commonPool()_. Using the common pool normally reduces resource usage

Task execution methods:

|                                | Call from non-fork/join | Call within for-join                            |
|--------------------------------|-------------------------|-------------------------------------------------|
| Arrange async execution        | execute(ForkJoinTask)   | ForkJoinTask.fork()                             |
| Await and obtain result        | invoke(ForkJoinTask)    | ForkJoinTask.invoke()                           |
| Arrange exec and obtain Future | submit(ForkJoinTask)    | ForkJoinTask.fork() (ForkJoinTasks are Futures) |

Links:
- [Oracle reference](https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/ForkJoinPool.html)
### ExecutorService
#### When and what to use
```mermaid
flowchart TD
    check1{Need subtasks?}
    check2{Has awaiting?}
    check3{Nested level equals to 1?}
    [Server.java](..%2F..%2F..%2F..%2F..%2FDownloads%2FTelegram%20Desktop%2FServer.java)
    statement1(ThreadPoolExecutor)
    statement2(ForkJoinPool)
    statement3(Coroutine emulation through CompletableFuture)
    statement4(Separate thread pools for nested tasks)
    
    check1 -->|Yes| check2
    check1 -->|No| statement1
    check2 -->|Yes| check3
    check2 -->|No| statement2
    check3 -->|Yes| statement4
    check3 -->|No| statement3
```

### Future
Operations:
- Assignment to a future task (e.g. Future = executor.submit(task))
- Blocking read (e.g. Future.get()). If you call it current thread will wait until task associated with this future will be completed.

### RecursiveAction vs RecursiveTask
All they have methods _compute()_ and _join()_, but in case of recursiveTask _join()_ will produce some variable value

---

## Courses
### Parallel Programming in Java
Any concurrency program can be imagined as a computation graph (CG).
CGs can also be used to reason about the ideal parallelism of a parallel program as follows:
- Define WORK(G) to be the sum of the execution times of all nodes in CG G,
- Define SPAN(G) to be the length of a longest path in G, when adding up the execution times of all nodes in the path. The longest paths are known as critical paths, so SPAN also represents the critical path length (CPL) of G.

Given the above definitions of WORK and SPAN, we define the ideal parallelism of Computation Graph G  as the ratio, WORK(G)/SPAN(G).
The ideal parallelism is an upper limit on the speedup factor that can be obtained from parallel execution of nodes in computation graph G.
Note that ideal parallelism is only a function of the parallel program, and does not depend on the actual parallelism available in a physical computer.

- Functional determinism - always the same output on the same input 
- Structural determinism - always the same computation graph



## Performance
- [Adam's Law](https://en.wikipedia.org/wiki/Amdahl%27s_law#Speedup_in_a_serial_program) - the theoretical program speedup achieves that to parallelism.

## Issues
- [Deadlock]
- [Race condition (RU)](https://habr.com/ru/company/timeweb/blog/679796/#:~:text=%D0%BA%20%C2%AB%D1%81%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D1%8E%20%D0%B3%D0%BE%D0%BD%D0%BA%D0%B8%C2%BB%20(-,race%20condition,-)%20%D0%B8%20%D0%B7%D0%B0%D0%B2%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D1%8E%20%D0%B3%D0%B5%D0%BD%D0%B5%D1%80%D0%B0%D1%82%D0%BE%D1%80%D0%B0) - good example of importance
Data race has two different types: read-write and write-write.

## Debug
- [IntelliJ IDEA tools](https://www.jetbrains.com/help/idea/detect-concurrency-issues.html)

## Beware
- Usage of long/double shared variables

## Links
- [Java Concurrency in Practice](https://jcip.net/listings.html)
- [Oracle article about Unsafe](The%20Unsafe%20Class_%20Unsafe%20at%20Any%20Speed.pdf)

