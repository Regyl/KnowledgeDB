# Introduction

# Content
- [Binding](#binding)
  - [Early](#early-binding)
  - [Late](#late-binding)
- [Nested classes](#Nested-classes)
- [Unclassified](#Unclassified)
- [Generics](#generics)
  - [Covariance, contravariance & invariance](#covariance-contravariance--invariance)
  - [Type erasure](#type-erasure)
  - [Reifiable](#reifiable)
  - [Heap pollution](#heap-pollution)
  - [Type inference](#type-inference)
- [Lambdas](#lambdas)
- [Streams](#streams)

# Binding
Binding is a bind between reference and code. More precisely, between:
- Method usage and method definition
- Variable usage and variable definition

There are 2 types of binding - *late* and *early*.
## Early binding
Happens during ***compile***.
In early binding happens below:
- Chose static method usage
- Chose final method usage
- Chose overloading method usage

Due to this type of binding happens during compile time, it's faster.
## Late binding
Happens during ***execution***.
On this stage happens next events:
- Chose polymorphic method usage
# Nested classes
There are 4 types of nested classes:
- Static nested classes
- Non-static nested classes
- Local classes
- Anonymous classes

# Unclassified
1. [(RU) Type-casting](https://javascopes.com/java-type-casting-b529c005/#:~:text=%D0%BC%D0%BE%D0%B6%D0%B5%D1%82%20%D1%80%D0%B0%D1%81%D1%88%D0%B8%D1%80%D0%B8%D1%82%D1%8C%20%D0%B5%D0%B3%D0%BE.-,%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0,-%D0%BF%D0%BE%D0%B4%D0%BE%D0%B1%D0%BD%D0%B0%20%D0%B4%D0%B8%D1%81%D1%82%D0%B0%D0%BD%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%BE%D0%BC%D1%83%20%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D1%8E)
2. [Package-private modifier](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html#:~:text=protected%2C%20or%20package%2Dprivate%20(-,no%20explicit%20modifier,-).)
    1. ***package-private*** means that other members of the same package have access to the item. Also named *no modifier*.
    2. ![img.png](access-levels.png)

# Generics
Generic is a compilation-time future, that afford to preserve from trying 
to use different types in one container (i.e. collection).
- Available from Java 5
- [Oracle](https://docs.oracle.com/javase/tutorial/java/generics/types.html)
- [(RU) Habr](https://habr.com/ru/company/sberbank/blog/416413/)
## Covariance, contravariance & invariance
Basically generics are *invariance*. That means we cannot compile code below:
```java
List<Integer> ints = Arrays.asList(1,2,3);
List<Number> nums = ints; // compile-time error
```

Also, they can be *covariance* (or bounded from below). We CAN do this:
```java
List<Integer> ints = new ArrayList<Integer>();
List<? extends Number> nums = ints;
```

And *contravariance* (bounded from above):
```java
List<Number> nums = new ArrayList<Number>();
List<? super Integer> ints = nums;
```
---
Must underline that:
- We cannot add elements to covariance generics
- We cannot read elements from contravariance generics  

To remember what and when, exists thing named PECS - Producer Extends Consumer Super:  
If we define wildcard with extends, it's producer that produce (reading) elements. Else 
is consumer which only consume (writing) elements.
## Type erasure
During compilation happens thing named *type erasure*. To preserve 
reverse compatibility with older versions of Java, compiler:
- Replace type parameters in generic type with their bound if bounded type parameters are used:
```java
<T extends Comparable<T>>  -->  Comparable
```
- Replace type parameters in generic type with Object if unbounded type parameters are used.
- Insert type casts to preserve type safety.
- Generate bridge methods to keep polymorphism in extended generic types - [StackOverflow](https://ru.stackoverflow.com/questions/1003660/bridge-%D0%BC%D0%B5%D1%82%D0%BE%D0%B4%D1%8B-java)
## Reifiable
Type if reifiable, if we can obtain its info during runtime. Due to reverse
compatibility, we CAN obtain info about generics below:
- primitives
- Not parametrized objects
- Parametrized with unbounded wildcards
- Raw types
- arrays
And CANNOT about next three. They are not reifiable:
- Variable of type (T)
- Parametrized with type parameter (List<Number> ArrayList<String>, List<List<String>>)
- Parametrized with bounded above/below (List<? extends Number>, Comparable<? super String>)

Important to note that we *CAN* get generic type thanks to reflection:
```java
java.lang.reflect.Method.getGenericReturnType()
```
## Heap pollution
We can compile the code below:
```java
static List<String> t() {
   List l = new ArrayList<Number>();
   l.add(1);
   List<String> ls = l; // Heap pollution happens
   ls.add("");
   return ls;
}
```
And we will receive an ClassCastException during ls.get(0).
## Type Inference
We can compile code below thanks to diamond operator and type inference from context:
```java
List<Integer> list = new ArrayList<>(); //No type in ArrayList definition
```
# Lambdas
For example:
```java

```
# Streams
- [(RU) Habr](https://habr.com/ru/company/luxoft/blog/270383/) - general info
