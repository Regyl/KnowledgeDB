# Introduction

## Variable naming
- They should differs (e.g. XYZControllerForEfficientHandlingOf and XYZControllerForEfficientStorageOfStrings)
- <value>In<UnitOfMeasure> (e.g. maxLifetimeInDays)
- Variable's name length should correlate with its usage scope
- *ShapeFactoryImpl* for subclass is ***better*** than *IShapeFactory* 
- Class name ***should*** use such names as Customer, WikiPage, Account and AddressParser and ***should not***
include words like Manager, Processor, Data or Info (but I am strongly disagree with it)
- Instead of overloading constructor use static fabric methods (Complex.FromRealNumber(23.0) is better than new Complex(23.0))
- In zoo of synonyms (fetch, retrieve and get) choose one 
- When choosing a variable's name, firstly, imagine a programmatic one. If there is no such words, 
choose work area-specific
- Add context when variable used separately from it
> No worse reason for choosing name *c* than case, when *a* and *b* are already busy.

## Method naming
- Method can execute multiple operations but only on the one abstraction level
- Less method arguments and output (from point of testing)
- boolean argument is bad.
- Isolate try/catch

## Comments
- Do not use them if possible.
- Good programmer should support comments actuality, but better (from view point of Uncle Bob) to support better code