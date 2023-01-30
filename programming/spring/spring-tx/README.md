# Introduction
About Spring's transaction support

# Content
1. [@Transactional](#transactional)
2. [TransactionTemplate](#transaction-template)
3. [Configuration](#configuration)
   1. [Propagation](#propagation)


# Transactional

# Transaction Template
- recommended by Spring's team

Better when you must call database and an external service in one transaction.

In the case below annotation **@Transactional** will borrow connect to DB until
external service respond. Imagine we had 1 RPS (request-per-second). After three minutes
we will hold opened 3*60=180 connections!
```java
public class OrderService {
    
    private final FeignClient externalService;
    
    private final OrderRepository orderRepository;
    
    public void doSomething(Order order) {
        orderRepository.save(order);
        
        //Imagine he's bad and don't respond some minutes
        externalService.closeOrder(order);
    }
}
```

# Configuration
## Propagation
- Required (default)
- Requires new
- Mandatory
- Supports
- Not supported
- Never

[//]: # (FIXME)