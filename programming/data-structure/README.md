# Introduction

# Content
- [Tree](#tree)
  - [Red-Black](#red-black-tree)
- [Heap](#heap)


## Tree
Searching is always O(logn)
### Red-black tree
There are 5 properties:
1. Root is black
2. Every node must be red or black
3. Black node can have red or black leafs. Red can have ***only black leafs***
4. Black depth must be equals for each leaf sequence
5. Null-leafs must be black

- Inserting happens in null-leaf, after what occurs a rebalancing - [(RU) Habr](https://habr.com/ru/post/330644/)

## Heap
Balanced tree
- Min-heap the minimum element is the root
- Max-heap the maximum element is the root