# Introduction
The Java Virtual Machine is an abstract computing machine. 
Like a real computing machine, it has an instruction set and 
manipulates various memory areas at run time.

# Content
1. [Basics](#basics)
   1. [Compilation](#compilation-workflow)
   2. [JRE](#java-runtime-environment) - Java Runtime Environment
      1. [Classloader](#classloader)
      2. [JIT](#just-in-time) - Just-In-Time
      3. [AOT](#ahead-of-time) - Ahead-Of-Time
2. [HotSpot](#hotspot)
3. [GraalVM](#graalvm)
4. [Links](#links)

## Basics
### Compilation workflow
```mermaid
flowchart LR;
   A-.->B;
```
### Java Runtime Environment
#### Classloader
#### Just-In-Time
#### Ahead-Of-Time
### Links
1. [Oracle specification](https://docs.oracle.com/javase/specs/jvms/se11/html/index.html) - for JavaSE 11

## HotSpot
- Written in С++

## GraalVM
- Written in Java
- Based on HotSpot
- Support JIT/AOT compilation