# Introduction
AMQP - protocols

# Content
1. [Producer](#producer)
2. [Consumer](#consumer)
3. [What to note when implementing new business-logic](#what-to-note-when-implementing-new-business-logic)
4. [Exactly-once semantic](#exactly-once-semantic)
   1. [Exactly-once producer](#exactly-once-producer)
5. [Internals](#internals)


## Producer
- To avoid resources utilization, multiple messages commonly combined into one package (**batch**), 
relates to one partition of target topic. Such case package requires less time to process.
Also, important to note that one huge package requires more time to replication.
- Since topic contains of multiple partitions, it's **not guaranteed an orderliness
within entire topic** - only within one partition
- Separate thread is responsible for message send to kafka from your application
- There are 3 data sending methods:
  - Send and forget. No matter is broker accepted it
  - Synchronously sending (technically send mechanism is async, but you can call get() and block the thread)
  - Asynchronously sending
- Funny moment with acks mode and entire (end-to-end) latency time:
  - Entire latency time measures as time between message sending and start of it's processing. When u set ack=0/1, then you can
  send messages more frequently. But if the only parameter matters for u is entire latency time, then no reason is ack set tp 0 or all
  cause Kafka doesn't allow to read message till it will be replicated to all brokers.


## Consumer
- The highest throughput reached when number of consumers equals to number of partitions (within one consumer group)
- There is two ways to rebalance partitions (when some added or deleted):
  - Blocking - all consumers stops and after acquires new partitions
  - Non-blocking (incremental rebalance) - some consumer stops, acquires new partitions. Then another multiple consumers stops
  and so on till balance will be reached (same number of partition per consumer)
- Consumer consider as died when no heartbeat signal for multiple seconds (and then cluster controller initializes rebalance)
- Under the hood consumer mechanism is a simple infinite polling:
```java
public void idk() {
    Duration timeout = Duration.ofMillis(100);
    while (true) {
        ConsumerRecords<String, String> records = consumer.poll(timeout);
        for (ConsumerRecord<String, String> record : records) {
            System.out.printf("topic = %s, partition = %d, offset = %d, customer = %s, country = %s\n",
                record.topic(), record.partition(), record.offset(), record.key(), record.value());
            int updatedCount = 1;
            if (custCountryMap.countainsKey(record.value())) {
                updatedCount = custCountryMap.get(record.value()) + 1;
            }
            custCountryMap.put(record.value(), updatedCount);
            JSONObject json = new JSONObject(custCountryMap);
            System.out.println(json.toString());
        }
    }
}
```
- Offset can be committed in 2 ways:
  - Using enable.autocommit. In this case, each consumer.poll(interval) will commit last processed message. By default commits every 5 seconds
  - Using commitSync() for manual commit (to avoid message duplication). In this case, thread will be blocked till broker answer
  - Using commitAsync()
    - The different between commitSync() and commitAsync() in their behaviour during exception. commitSync will try to commit again and again
    but commitAsync will not since there can be commit newer offset when current. But there is a way to avoid such problems in commitAsync using
    state in application which will store latest success offset per thread/consumer.


## What to note when implementing new business-logic
When u starts using a Kafka, it's a good idea to ask yourself these questions:
- Is message lost acceptable
- Is message duplicate acceptable
- Is message processing time - critical parameter or latency is acceptable

How to choose topic number - https://oreil.ly/ortRk. Main ideas:
- More partitions lead to higher throughput
- More partitions requires more open file handles
- More partitions may increase unavailability (when broker is down, cluster controller should find new leader for all it's partitions)
- More partitions may increase end-to-end latency
  -  By default, a Kafka broker only uses a single thread to replicate data from another broker, 
  for all partitions that share replicas between the two brokers. 
  And the greater number of partitions requires greater time for replicating
- More partitions may require more memory in the client

## Exactly-once semantic
Before read below, choose do u really need exactly-once semantics. If u produce and 
consume records by yourself, it's better to add unique key in headers and temporary store
them somewhere because **it's produce higher throughput**.

### Exactly-once producer:
When enable idempotence in producer, producer adds PID (producer ID), which in combination with
partition and topic name allows to unique identify a message. When sending a message, broker checks
last 5 (by default, configurable using max.inflight.requests) messages to check is this a duplicate
message

## Internals
- Kafka broker should work in a cluster (multiple brokers). One of them works as cluster controller
  It binds partitions to brokers and monitor brokers failures.
- Key Kafka ability is to store data for a long time. Also Kafka able to store only the last
  message in a topic with exact key - log-compacted mode (useful when we need only last data update).
- By default, a Kafka broker only uses a single thread to replicate data from another broker,
  for all partitions that share replicas between the two brokers.
- ZooKeeper used for:
  - To choose controller cluster
  - To store metadata (brokers, configs, topics, partitions, replicas)
- Replications is the keystone since kafka uses as distributed sectioned service of replicationed fixation journal


![img.png](Высокоуровневый%20обзор%20компонентов%20производителей%20Kafka)