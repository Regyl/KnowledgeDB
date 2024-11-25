# Introduction

Links:
- [Idk](https://www.scientecheasy.com/2021/09/annotations-in-java.html)
# Content
- [Target](#target)

> Meta-annotations - are annotations contains other annotations.
> Another explanation - annotations applied to other annotations

## @Target
> What place to use annotation
## @Retention
### Source
> Discarded by compiler
### Class
> Discarded during class load. Useful when doing bytecode-level post-processing. Default.
### Runtime
> Available at runtime by reflection

## @Inherited
Can be inherited by subclasses

## @Documented
Marker annotation to generate annotations in Javadoc
